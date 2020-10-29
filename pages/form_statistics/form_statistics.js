google.charts.load('current', { packages: ['corechart', 'bar'] });

$(document).ready(function () {
  renderData();
});

function renderData() {
  $.ajax({
    url: 'frontend/renderData.php',
    method: 'post',
    data: {},
    success: function (data, status) {
      $('#records_content').html(data);
      noRenderForBlankOptions();
    },
  });
}

function noRenderForBlankOptions() {
  var x = document.getElementsByClassName('option');
  var y = document.getElementsByClassName('outeroption');
  //console.log(x);
  //console.log(y);
  for (var i = 0; i < x.length; i++) {
    if (x[i].innerText == '') {
      y[i].style.display = 'none';
    }
  }
}

function drawPieChart(count, Q_id) {
  var data = google.visualization.arrayToDataTable([
    ['Task', 'User Response'],
    ['Option 1', parseInt(count[0])],
    ['Option 2', parseInt(count[1])],
    ['Option 3', parseInt(count[2])],
    ['Option 4', parseInt(count[3])],
    ['Option 5', parseInt(count[4])],
  ]);

  var countTotal =
    parseInt(count[0]) +
    parseInt(count[1]) +
    parseInt(count[2]) +
    parseInt(count[3]) +
    parseInt(count[4]);

  var options = {
    is3D: true,
    title: 'Total Response: ' + countTotal,
  };

  var chart = new google.visualization.PieChart(
    document.getElementById('piechart' + Q_id)
  );
  chart.draw(data, options);
}

function drawColumnChart(count, Q_id) {
  var data = google.visualization.arrayToDataTable([
    ['Options', 'Response'],
    ['1', parseInt(count[0])],
    ['2', parseInt(count[1])],
    ['3', parseInt(count[2])],
    ['4', parseInt(count[3])],
    ['5', parseInt(count[4])],
  ]);

  var countTotal =
    parseInt(count[0]) +
    parseInt(count[1]) +
    parseInt(count[2]) +
    parseInt(count[3]) +
    parseInt(count[4]);

  var options = {
    chart: {
      title: 'Total Response: ' + countTotal,
    },
  };

  var chart = new google.charts.Bar(
    document.getElementById('columnchart' + Q_id)
  );

  chart.draw(data, google.charts.Bar.convertOptions(options));
}

function drawColumnChartForMulti(count, Q_id) {
  var data = google.visualization.arrayToDataTable([
    ['Options', 'Response'],
    ['1', parseInt(count[0])],
    ['2', parseInt(count[1])],
    ['3', parseInt(count[2])],
    ['4', parseInt(count[3])],
    ['5', parseInt(count[4])],
  ]);

  var countTotal = parseInt(count[5]);

  var options = {
    chart: {
      title: 'Total Response: ' + countTotal,
    },
  };

  var chart = new google.charts.Bar(
    document.getElementById('columnchart' + Q_id)
  );

  chart.draw(data, google.charts.Bar.convertOptions(options));
}

function drawColumnChartForRating(count, Q_id) {
  var data = google.visualization.arrayToDataTable([
    ['Rating', 'Response'],
    ['1 Star', parseInt(count[0])],
    ['2 Stars', parseInt(count[1])],
    ['3 Stars', parseInt(count[2])],
    ['4 Stars', parseInt(count[3])],
    ['5 Stars', parseInt(count[4])],
  ]);

  var countTotal =
    parseInt(count[0]) +
    parseInt(count[1]) +
    parseInt(count[2]) +
    parseInt(count[3]) +
    parseInt(count[4]);

  var options = {
    chart: {
      title: 'Total Response: ' + countTotal,
    },
  };

  var chart = new google.charts.Bar(
    document.getElementById('columnchart' + Q_id)
  );

  chart.draw(data, google.charts.Bar.convertOptions(options));
}

function getResponseForRadio(Q_id) {
  $.ajax({
    url: 'backend/getResponse.php',
    method: 'post',
    data: { Q_id: Q_id },
    success: function (data1, status) {
      var count = data1.split(',');
      drawPieChart(count, Q_id);
      drawColumnChart(count, Q_id);
    },
  });
}

function getResponseForMulti(Q_id) {
  $.ajax({
    url: 'backend/getResponse.php',
    method: 'post',
    data: { MQ_id: Q_id },
    success: function (data1, status) {
      var count = data1.split(',');
      drawColumnChartForMulti(count, Q_id);
    },
  });
}

function getResponseForLinearScale(Q_id) {
  $.ajax({
    url: 'backend/getResponse.php',
    method: 'post',
    data: { Q_id: Q_id },
    success: function (data1, status) {
      var count = data1.split(',');
      drawPieChart(count, Q_id);
      drawColumnChart(count, Q_id);
    },
  });
}

function getResponseForRating(Q_id) {
  $.ajax({
    url: 'backend/getResponse.php',
    method: 'post',
    data: { rating_Q_id: Q_id },
    success: function (data1, status) {
      var count = data1.split(',');
      drawPieChart(count, Q_id);
      drawColumnChartForRating(count, Q_id);
      //console.log(count);
    },
  });
}

function renderStatsOnLoad() {
  var cards = document.getElementsByClassName('stats');
  for (var i = 0; i < cards.length; i++) {
    var id = cards[i].id;
    var type = cards[i].querySelector('div.type').innerHTML;
    if (type == 'radio') {
      getResponseForRadio(id);
    }
    if (type == 'multiplechoice') {
      getResponseForMulti(id);
    }
    if (type == 'linearscale') {
      getResponseForLinearScale(id);
    }
    if (type == 'rating') {
      getResponseForRating(id);
    }
  }
  var print = document.getElementById('print');
  print.style.display = 'inline-block';
}

function printPage() {
  var printArea = document.getElementById('records_content').innerHTML;
  var originalContent = document.body.innerHTML;
  document.body.innerHTML = printArea;
  //var x = document.getElementById('print');
  //x.style.display = 'none';
  window.print();
  document.body.innerHTML = originalContent;
}
