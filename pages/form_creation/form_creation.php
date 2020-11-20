<?php

session_start();

?>

<!DOCTYPE html>
<html>
<head>
	<title>
  
  <?php

    echo $_SESSION["Form_name"];

  ?>
  
  </title>
	 	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
      <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    	<link rel="stylesheet" href="form_creation.css">
</head>
<body>

  <div class="container-fluid">
    <div class="row">
  		<div class="col-sm-4">
      <br>
  			<div class="sticky-top">
  				<h4 align="center">Create Question</h4>
  				<form name="create-question">
  				  <div class="md-form">
		          	<label for="question">Enter the question</label>
		          	<input type="text" autocomplete="off" name="" id="question" class="form-control">
	        	</div>
	        	<div class="form-group">
		        	<label for="type">Type:</label>
	    			<select name="type" id="type" class="browser-default custom-select" onchange="optionhidefortext()" >
	    			<option value="radio">radio</option>
	    			<option value="text" >text</option>
	    			<option value="multiplechoice">multiplechoice</option>
            <option value="linearscale">linear scale</option>
            <option value="rating">rating</option>
	    			</select>
	        	</div>
            <div class="form-group" id="ratings">
              <label for="createratingscale">Rating Scale:</label>
              <select name="createratingscale" id="createratingscale" class="browser-default custom-select" onchange="optionmanipulate()">
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </div>
	        	<div id="option" name="option">
			        <div class="md-form md-outline" id="option1div">
			           <label for="option1">Enter Option 1</label>
			          <input type="text" autocomplete="off"  id="option1" name="optiondefault" class="form-control">
			        </div>
			        <div class="md-form md-outline" id="option2div">
			           <label for="option2">Enter Option 2</label> 
			          <input type="text" autocomplete="off"  id="option2" name="optiondefault" class="form-control">
			        </div>
			        <div class="md-form md-outline" id="option3div">
			           <label for="option3">Enter Option 3</label>
			          <input type="text" autocomplete="off"  id="option3" name="optiondefault" class="form-control">
			        </div>
			        <div class="md-form md-outline" id="option4div">
			           <label for="option4">Enter Option 4</label>
			          <input type="text" autocomplete="off"  id="option4" name="optiondefault" class="form-control">
			        </div>
			        <div class="md-form md-outline" id="option5div">
			           <label for="option5">Enter Option 5</label>
			          <input type="text" autocomplete="off"  id="option5" name="optiondefault" class="form-control">
			        </div>
	    	</div>
	    	<div>
	        <button type="button" class="btn btn-primary" onclick="addRecord()">Save
	        </button>
	        <button type="button" class="btn btn-danger" onclick="formSubmit()">Clear
	        </button>
	        </div>
	  		</form>
	      </div>
  			</div>
        <div id="records_content" class="col-sm-8">
        
        </div>
  		</div>
  	</div>
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
 
	<script type="text/javascript">

		$(document).ready(function(){
        readRecords();
        optionhidefortext();
      });
      
      function readRecords(){
        var readrecord = "readrecord";
        $.ajax({
          url:"load_data.php",
          type:"post",
          data: { readrecord:readrecord },
          success:function(data,status){
            $('#records_content').html(data);
            if (status == 'success') {
            	optionhidefortextonrefresh(); 
              optiondisplayforratingonrefresh();
              $(function () {
                $('[data-toggle="tooltip"]').tooltip()
              });          
            	}
          }
        });
      }

       function addRecord(){
        var question = $('#question').val();
        var type = $('#type').val();
        var rating = $('#createratingscale').val();
        var option1 = $('#option1').val();
        var option2 = $('#option2').val();
        var option3 = $('#option3').val();
        var option4 = $('#option4').val();
        var option5 = $('#option5').val();

        if (type == 'text'){
          rating = option1 = option2 = option3 = option4 = option5 =  null;
        }
        else if (type == 'radio'  || type == 'multiplechoice'){
          rating = null;
        }
        else if (type == 'rating'){
         rating = option1 = option2 = option3 = option4 = option5 = null;
        }

        if ( question !== "") {
          $.ajax({
          url:"send_data.php",
          type:"post",
          data: { question : question,
          	  type : type,
              rating : rating,	
              option1 : option1,
              option2 : option2,
              option3 : option3,
              option4 : option4,
              option5 : option5,
           },

           success:function(data,status){
            readRecords();
            formSubmit();
           }

        });
      }
      else {
        alert("Question Field can not be empty");
      }
      }

      function updatetheparticularchange(element,column,id) {
        if(column == 2){
          var value1 = element.value;
            var id1 = element.name;
            var a = document.getElementById(id1);
            if (value1 == 'text' || value1 == 'rating') {
              a.style.display = "none";
            }
            else if(value1 == 'linearscale'){
            }
            else {
              a.style.display = "block";
            }
        }
          var value = element.value;
        $.ajax({
              url:'load_data.php',
              type:'post',
              data: {
                value: value,
                column: column,
                id: id
              },
              success:function(data,status){
                 readRecords();
              }
            });
      }

      function optiondisplayforratingonrefresh(){
        var x = document.getElementsByClassName("content");
        var a = document.getElementsByClassName("ratingscalearea");
        for (i=0; i<x.length; i++){
          var op1 = document.getElementsByName("optionclass1")[i];
          var op2 = document.getElementsByName("optionclass2")[i];
          var op3 = document.getElementsByName("optionclass3")[i];
          var op4 = document.getElementsByName("optionclass4")[i];
          var op5 = document.getElementsByName("optionclass5")[i];
          if(a[i].value == '2'){
            op3.style.display = "none";
            op4.style.display = "none";
            op5.style.display = "none";
           }
           else if(a[i].value == '3'){
             op4.style.display = "none";
             op5.style.display = "none";
           }
           else if(a[i].value == '4'){
             op5.style.display = "none";
           }
           else {
           }
        }
      }

       function deleteQuestion(deleteid){

        var conf = confirm("Are you sure?");
        if(conf==true){
          $.ajax({
            url:"send_data.php",
            type:"post",
            data: { deleteid:deleteid },
            success:function(data,status){
              readRecords();
            }
          });
        }
      }


      function duplicate1(copyid){
        var copyquestion = document.getElementById(copyid).querySelector(".questionclass").value;
        var copytype = document.getElementById(copyid).querySelector(".selectarea").value;
        var copyscale = document.getElementById(copyid).querySelector(".ratingscalearea").value;
        var copyoption1 = document.getElementById(copyid).querySelectorAll(".optionclass")[0].value;
        var copyoption2 = document.getElementById(copyid).querySelectorAll(".optionclass")[1].value;
        var copyoption3 = document.getElementById(copyid).querySelectorAll(".optionclass")[2].value;
        var copyoption4 = document.getElementById(copyid).querySelectorAll(".optionclass")[3].value;
        var copyoption5 = document.getElementById(copyid).querySelectorAll(".optionclass")[4].value;

        $.ajax({
            url:"send_data.php",
            type:"post",
            data: { copyquestion:copyquestion,
                    copytype:copytype,
                    copyscale:copyscale,
                    copyoption1:copyoption1,
                    copyoption2:copyoption2,
                    copyoption3:copyoption3,
                    copyoption4:copyoption4,
                    copyoption5:copyoption5},
            success:function(data,status){
              readRecords();
              alert("The Question has been added to the bottom");
            }
          });
      }

     function optionhidefortext() {
     	var value = document.getElementById("type").value;
     	var a = document.getElementById("option");
      var b = document.getElementById("ratings");
      var c = document.getElementById("createratingscale");
      var option1 = document.getElementById("option1div");
      var option2 = document.getElementById("option2div");
      var option3 = document.getElementById("option3div");
      var option4 = document.getElementById("option4div");
      var option5 = document.getElementById("option5div");
     	if (value == 'text') {
        a.style.display = "none";
        b.style.display = "none";
        option1.querySelector("#option1").value = null;
        option2.querySelector("#option2").value = null;
        option3.querySelector("#option3").value = null;
        option4.querySelector("#option4").value = null;
        option5.querySelector("#option5").value = null;
     	}
      else if (value == 'radio' || value == 'multiplechoice') {
        a.style.display = "block";
        b.style.display = "none";
        option1.style.display = "block";
        option2.style.display = "block";
        option3.style.display = "block";
        option4.style.display = "block";
        option5.style.display = "block";
        option1.querySelector("#option1").value = null;
        option2.querySelector("#option2").value = null;
        option3.querySelector("#option3").value = null;
        option4.querySelector("#option4").value = null;
        option5.querySelector("#option5").value = null;
      }
      else if (value == 'linearscale'){
        a.style.display = "block";
        b.style.display = "block";
        option1.style.display = "block";
        option2.style.dispay = "block";
        option1.querySelector("#option1").value = null;
        option2.querySelector("#option2").value = null;
        option3.querySelector("#option3").value = null;
        option4.querySelector("#option4").value = null;
        option5.querySelector("#option5").value = null;
        optionmanipulate();
      }
      else if (value == 'rating'){
        a.style.display = "none";
        b.style.display = "none";
        option1.querySelector("#option1").value = null;
        option2.querySelector("#option2").value = null;
        option3.querySelector("#option3").value = null;
        option4.querySelector("#option4").value = null;
        option5.querySelector("#option5").value = null;
      }
     }

     function optionmanipulate() {
      var value = document.getElementById("createratingscale").value;
      var option1 = document.getElementById("option1div");
      var option2 = document.getElementById("option2div");
      var option3 = document.getElementById("option3div");
      var option4 = document.getElementById("option4div");
      var option5 = document.getElementById("option5div");
      if (value == '2'){
          option1.style.display = "block";
          option2.style.display = "block";
          option3.style.display = "none";
          option4.style.display = "none";
          option5.style.display = "none";
        }
        else if (value == '3'){
          option1.style.display = "block";
          option2.style.display = "block";
          option3.style.display = "block";
          option4.style.display = "none";
          option5.style.display = "none";
        }
        else if (value == '4'){
          option1.style.display = "block";
          option2.style.display = "block";
          option3.style.display = "block";
          option4.style.display = "block";
          option5.style.display = "none";
        }
        else if (value == '5'){
          option1.style.display = "block";
          option2.style.display = "block";
          option3.style.display = "block";
          option4.style.display = "block";
          option5.style.display = "block";
        }
     }

     function optionhidefortextonrefresh() {
     	var x = document.getElementsByClassName("content");
     	var a = document.getElementsByClassName("selectarea");
     	var b = document.getElementsByClassName("optionarea");
      var c = document.getElementsByName("ratingdisplay");
      var d = document.getElementById("rating");
     	for (var i=0; i < x.length; i++) {
     		if (a[i].value == 'text'){
     			b[i].style.display = "none";
          c[i].style.display = "none";
        }
        else if (a[i].value == 'linearscale'){
        }
        else if (a[i].value == 'rating'){
          b[i].style.display = "none";
          c[i].style.display = "none";
        }
     		else {
          c[i].style.display = "none";
     		}
     	}
     }

     function formSubmit() {
      var question = document.getElementById("question");
      var type = document.getElementById("type");
      var createrating = document.getElementById("createratingscale");
      var rating = document.getElementById("ratings");
      var dis = document.getElementById("option");
      var op1 = document.getElementById("option1div");
      var op2 = document.getElementById("option2div");
      var op3 = document.getElementById("option3div");
      var op4 = document.getElementById("option4div");
      var op5 = document.getElementById("option5div");
      var option1 = document.getElementById("option1");
      var option2 = document.getElementById("option2");
      var option3 = document.getElementById("option3");
      var option4 = document.getElementById("option4");
      var option5 = document.getElementById("option5");
      question.value = null;
      type.value = "radio";
      option1.value = null;
      option2.value = null;
      option3.value = null;
      option4.value = null;
      option5.value = null;
      rating.style.display = "none"; 
      dis.style.display = "none";
      dis.style.display = "block";
      op1.style.display = "block";
      op2.style.display = "block";
      op3.style.display = "block";
      op4.style.display = "block";
      op5.style.display = "block";
     }

     function openPreviewPage() {
      window.open('../form_preview/form_preview.php', '_blank');
     }

	</script>
</body>
</html>
