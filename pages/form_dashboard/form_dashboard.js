$(document).ready(function () {
  loadFormdata();
  createForm();
  loadSharedFormdata();
  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });
  // shareModal();
});

// This renders Form data in the front end
// runs: When onload website
function loadFormdata() {
  $.ajax({
    url: 'frontend/renderFormData.php',
    method: 'post',
    data: {},
    success: function (data, status) {
      $('#form-content').html(data);
      //console.log('Form data render is working');
    },
  });
}

function checkForPublish(F_id) {
  $.ajax({
    url: 'backend/checkForPublish.php',
    method: 'post',
    data: { F_id: F_id },
    success: function (data, status) {
      //console.log(data);
      if (parseInt(data) === 1) {
        $('#stopResponse' + F_id).modal('show');
      } else {
        $('#notPublished' + F_id).modal('show');
      }
    },
  });
}

function loadSharedFormdata() {
  var read = 'read';
  $.ajax({
    url: 'frontend/renderSharedFormData.php',
    method: 'post',
    data: { read: read },
    success: function (data, status) {
      $('#shared_content').html(data);
      //console.log('Shared data render is working');
    },
  });
}




// This Renders Version table in the frontend
// runs: When VIEW button is clicked
function getFormVersions(F_id) {
  //console.log('dynamic button is working');

  $.ajax({
    url: 'frontend/renderFormVersionData.php',
    method: 'post',
    data: {
      F_id: F_id,
    },
    success: function (data, success) {
      //$('#form-version-content').html(data);
      var parent = document.getElementById(F_id);
      var child = document.getElementById('form_version_content' + F_id);
      parent.appendChild(child);
      $(child).html(data);
      //$('form_version_content' + F_id).html(data);
      var x = document.getElementsByClassName('published1')[0];
      if (x == null) {
      } else {
        x.style.color = 'red';
        x.style.background = '#ffcccb';
      }
      //console.log(x);
    },
  });
}

function unPublishForm(F_id) {
  $.ajax({
    url: 'backend/checkForPublish.php',
    method: 'post',
    data: { publish_F_id: F_id },
    success: function (data, status) {
      //$('#form-content').html(data);
      //console.log('Form data render is working');
      getFormVersions(F_id);
    },
  });
}

// THIS ECHO'S A MODAL FORM TO THE FRONT END
// runs: onload
function createForm() {
  //console.log('working');

  $.ajax({
    url: 'frontend/createModal.php',
    method: 'post',
    data: {},
    success: function (data, status) {
      $('#modal-area').html(data);
    },
  });
}

// This insert the new form values from the MODAL into the form table
// runs: When clicked SAVE button on MODAL
function insertNewForm() {
  let formName = $('#form-name').val();
  let formDescription = $('#form-description').val();

  $.ajax({
    url: 'backend/setFormDetails.php',
    method: 'post',
    data: {
      formName: formName,
      formDesc: formDescription,
    },
    success: function (data, success) {
      //console.log(data);
      $('#close-modal').click();
      loadFormdata();
      $('#form-name').html();
      $('#form-description').html();
    },
  });
}

function deleteForms(F_id) {
  const conf = confirm('Are you sure you wanna delete the form ?');
  if (conf == true) {
    $.ajax({
      url: 'backend/deleteForm.php',
      method: 'post',
      data: {
        F_id: F_id,
      },
      success: function (data, success) {
        //console.log(data);
        if (success == 'success') {
          loadFormdata();
          $('#form-version-content').html('Form is deleted');
        }
      },
    });
  }
}

function deleteFormVersion(F_id) {
  const conf = confirm('Are you sure you wanna delete the form ?');
  if (conf == true) {
    $.ajax({
      url: 'backend/deleteFormVersion.php',
      method: 'post',
      data: {
        F_id: F_id,
      },
      success: function (data, success) {
        console.log(data);
        if (success == 'success') {
          loadFormdata();
        }
      },
    });
  }
}

function createVersion(F_id) {
  //console.log('version button asdf working');
  $.ajax({
    url: 'backend/createNewFormVersion.php',
    method: 'post',
    data: {
      F_id: F_id,
    },
    success: function (data, status) {
      // var x = parseInt(data);
      var str = data;
      var matches = str.match(/(\d+)/);
      // console.log(matches[0]);
      getFormVersions(matches[0]);
    },
  });
}

function publishForm(F_id) {
  var a = document
    .getElementById('publishModal' + F_id + '')
    .querySelector('.publishClass1').value;
  var b = document
    .getElementById('publishModal' + F_id + '')
    .querySelector('.publishClass2').value;
  var c = document
    .getElementById('publishModal' + F_id + '')
    .querySelector('.publishClass3').value;
  var d = document
    .getElementById('publishModal' + F_id + '')
    .querySelector('.publishClass4').value;
  var e = document
    .getElementById('publishModal' + F_id + '')
    .querySelector('.publishClass5').value;
  var f = document
    .getElementById('publishModal' + F_id + '')
    .querySelector('.publishClass6').value;
  // console.log(a);
  $.ajax({
    url: 'frontend/publishModal.php',
    method: 'post',
    data: {
      F_id: F_id,
      Role: a,
      Department: b,
      Year: c,
      Division: d,
      Start: e,
      End: f,
    },
    success: function (data, status) {},
  });
}

function editFormDetails(F_id) {
  // let value = element.innerText;
  var x = document.getElementById('editFormName' + F_id).value;
  var y = document.getElementById('editFormDescription' + F_id).value;
  //console.log(x + y);
  $.ajax({
    url: 'backend/updateFormDetails.php',
    method: 'post',
    data: {
      F_id: F_id,
      FormName: x,
      FormDescription: y,
    },
    success: function (data, success) {
      //console.log(data);
      if (success == 'success') {
        loadFormdata();
        //getFormVersions(F_id);
      }
    },
  });
}

function sendFormDetails(F_id) {
  let test = F_id;
  // alert(test)
  $.ajax({
    url: 'test.php',
    method: 'post',
    data: {
      F_id: test,
    },
    success: function (data, success) {
      if (success == 'success') {
        console.log(data);

        // alert("nothing delte");
        window.open('../form_creation/form_creation.php', '_self');
      }
    },
  });
}

function shareModal(F_id) {
  console.log('publish  sadfas working');
  $.ajax({
    url: 'frontend/shareModal.php',
    method: 'post',
    data: {
      F_id: F_id,
    },
    success: function (data, status) {
      $('#sharing-modal').html(data);
    },
  });
}

// function getResponse(F_id) {
//   $.ajax({
//     url: 'backend/getFormResponse.php',
//     method: 'post',
//     data: {
//       F_id: F_id,
//     },
//     success: function (data, success) {
//       $('#response_content' + F_id).html(data);
//       //console.log(data);
//     },
//   });
// }

function getUserNames(F_id) {
  $.ajax({
    url: 'backend/getUserNames.php',
    method: 'post',
    data: {
      F_id: F_id,
    },
    success: function (data, success) {
      window.location = 'form_stats_user.php';
      //console.log(data);
    },
  });
}

function goToStatsPage(F_id) {
  $.ajax({
    url: '../form_statistics/backend/getFormDetails.php',
    method: 'post',
    data: {
      F_id: F_id,
    },
    success: function (data, success) {
      window.location = '../form_statistics/form_statistics.php';
      //console.log(data);
    },
  });
}
