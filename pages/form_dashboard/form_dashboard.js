
$(document).ready( function() {
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
        success: function(data, status) {
            $('#form-content').html(data);
            console.log('Form data render is working');
        }
    });
}


// This Renders Version table in the frontend
// runs: When VIEW button is clicked
function getFormVersions(F_id) {
    console.log('dynamic button is working');

    $.ajax({
        url: "frontend/renderFormVersionData.php",
        method: "post",
        data: {
            F_id: F_id,
        },
        success: function(data, success) {
            console.log(" in renderformversion data ajax");
            $('#form-version-content').html(data);
        }
    });
}


// THIS ECHO'S A MODAL FORM TO THE FRONT END
// runs: onload
function createForm() {
    console.log('working');

    $.ajax({
        url: "frontend/createModal.php",
        method: "post",
        data: {},
        success: function(data, status) {
            $('#modal-area').html(data);   
        }
        
    });
}

// This insert the new form values from the MODAL into the form table
// runs: When clicked SAVE button on MODAL
function insertNewForm() {
    let formName = $('#form-name').val();
    let formDescription = $('#form-description').val();

    $.ajax({
        url: "backend/setFormDetails.php",
        method: "post",
        data: {
            formName : formName,
            formDesc : formDescription,
        },
        success: function(data, success) {
            console.log(data);
            $('#close-modal').click();
            loadFormdata();
            $('#form-name').html();
            $('#form-description').html();

        }
    })
}

function GetFormDetails(F_id) {
    $.ajax({
        url: "backend/setFormId.php",
        method: "post",
        data: {
            F_id: F_id,
        },
        success: function(data, success) {
            if(success == "success") {
                window.location.href = "../form_creation/form_creation.php";
            }
        }
    })
}


