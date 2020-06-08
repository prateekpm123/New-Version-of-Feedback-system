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

function getFormVersions(F_id) {
    console.log('dynamic button is working');

    $.ajax({
        url: "backend/renderFormVersionData.php",
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