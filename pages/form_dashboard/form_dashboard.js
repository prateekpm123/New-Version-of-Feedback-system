$(document).ready(function () {
  loadFormdata();
  createForm();
});

// This renders Form data in the front end
// runs: When onload website
function loadFormdata() {
  $.ajax({
    url: "frontend/renderFormData.php",
    method: "post",
    data: {},
    success: function (data, status) {
      $("#form-content").html(data);
      console.log("Form data render is working");
    },
  });
}

// This Renders Version table in the frontend
// runs: When VIEW button is clicked
function getFormVersions(F_id) {
  console.log("dynamic button is working");

  $.ajax({
    url: "frontend/renderFormVersionData.php",
    method: "post",
    data: {
      F_id: F_id,
    },
    success: function (data, success) {
      console.log(" in renderformversion data ajax");
      $("#form-version-content").html(data);
    },
  });
}

// THIS ECHO'S A MODAL FORM TO THE FRONT END
// runs: onload
function createForm() {
  console.log("working");

  $.ajax({
    url: "frontend/createModal.php",
    method: "post",
    data: {},
    success: function (data, status) {
      $("#modal-area").html(data);
    },
  });
}

// This insert the new form values from the MODAL into the form table
// runs: When clicked SAVE button on MODAL
function insertNewForm() {
  let formName = $("#form-name").val();
  let formDescription = $("#form-description").val();

  $.ajax({
    url: "backend/setFormDetails.php",
    method: "post",
    data: {
      formName: formName,
      formDesc: formDescription,
    },
    success: function (data, success) {
      console.log(data);
      $("#close-modal").click();
      loadFormdata();
      $("#form-name").html();
      $("#form-description").html();
    },
  });
}

function deleteForms(F_id) {
  const conf = confirm("Are you sure you wanna delete the form ?");
  if (conf == true) {
    $.ajax({
      url: "backend/deleteForm.php",
      method: "post",
      data: {
        F_id: F_id,
      },
      success: function (data, success) {
        console.log(data);
        if (success == "success") {
          loadFormdata();
          $("#form-version-content").html("Form is deleted");
        }
      },
    });
  }
}

function deleteFormVersion(F_id) {
  const conf = confirm("Are you sure you wanna delete the form ?");
  if (conf == true) {
    $.ajax({
      url: "backend/deleteFormVersion.php",
      method: "post",
      data: {
        F_id: F_id,
      },
      success: function (data, success) {
        console.log(data);
        if (success == "success") {
          loadFormdata();
        }
      },
    });
  }
}

function createVersion(F_id) {
  console.log("version button asdf working");
  $.ajax({
    url: "backend/createNewFormVersion.php",
    method: "post",
    data: {
      F_id: F_id,
    },
    success: function (data, status) {
      console.log(data);
      getFormVersions(F_id);
    },
  });
}

function publishForm(F_id) {
  console.log("publish  sadfas working");
  $.ajax({
    url: "frontend/publishModal.php",
    method: "post",
    data: {},
    success: function (data, status) {
      $("#publish-modal").html(data);
    },
  });
}

function otherSettings(F_id) {}

function updateFormName(element, column, F_id) {
  console.log("its running");
  let value = element.innerText;
  console.log(value, column);

  $.ajax({
    url: "backend/updateFormDetails.php",
    method: "post",
    data: {
      F_id: F_id,
      FormName: value,
      column: column,
    },
    success: function (data, success) {
      console.log(data);
      if (success == "success") {
        loadFormdata();
        getFormVersions(F_id);
      }
    },
  });
}

// function GetFormDetails(F_id) {
//     alert(F_id)
//     let Form_id = F_id
//     $.ajax({
//         url: "backend/set_form_id.php",
//         method: "post",
//         data: {
//             F_id : Form_id,
//         },
//         success: function(data, success) {
//             if(success == "success") {
//                 // window.location.href = "../form_creation/form_creation.php";
//                 window.location.href = "backend/set_form_id.php";

//             }
//         }
//     });
// }

function sendFormDetails(F_id) {
  let test = F_id;
  // alert(test)
  $.ajax({
    url: "test.php",
    method: "post",
    data: {
      F_id: test,
    },
    success: function (data, success) {
      if (success == "success") {
        console.log(data);

        // alert("nothing delte");
        window.location.href = "../form_creation/form_creation.php";
      }
    },
  });
}

function displaydiv(data, id) {}
