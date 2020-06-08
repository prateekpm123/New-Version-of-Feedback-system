function test() {
    console.log('test working');
}

$(document).ready( function() {
    loadFormdata();
});

function loadFormdata() {
    $.ajax({
        url: "backend/renderFormData.php",
        method: "post",
        data: {},
        success: function(data, status) {
            $('#form-content').html(data);
            console.log('Form data render is working');
        }
    });
}

function getFormVersions(Form_name) {
    console.log('dynamic button is working');

    $.ajax({
        url: "backend/renderFormVersionData.php",
        method: "post",
        data: {
            Form_name : Form_name,
        },
        success: function(data, success) {
            console.log(" in renderformversion data ajax");
            $('#form-version-content').html(data);
            
        }
    });
}