$(document).ready(function () {
    loadData();
});


$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
//Load Data function
function loadData() {
    $.ajax({
        url: "/User/List",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.UserID + '</td>';
                html += '<td>' + item.FullName + '</td>';
                html += '<td>' + item.EmailID + '</td>';
                html += '<td>' + item.City + '</td>';
                html += '<td>' + item.Country + '</td>';
                html += '<td>' + item.Status + '</td>';
                html += '<td><a href="#" onclick="return getbyID(' + item.UserID + ')">Edit</a>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//Add Data Function
function Add() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var empObj = {
        UserID: $('#UserID').val(),
        Name: $('#FullName').val(),
        EmailID: $('#EmailID').val(),
        PhoneNumer:$('#PhoneNumer').val(),
        City: $('#City').val(),
        Country: $('#Country').val(),
        Status: $('#Status').val()
    };
    $.ajax({
        url: "/User/Add",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//Function for getting the Data Based upon Employee ID
function getbyID(usrID) {
    $('#FullName').css('border-color', 'lightgrey');
    $('#EmailID').css('border-color', 'lightgrey');
    $('#PhoneNumer').css('border-color', 'lightgrey');
    $('#City').css('border-color', 'lightgrey');
    $('#Country').css('border-color', 'lightgrey');
    $('#Status').css('border-color', 'lightgrey');
    $.ajax({
        url: "/User/getbyID/" + usrID,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#UserID').val(result.UserID);
            $('#FullName').val(result.FullName);
            $('#EmailID').val(result.EmailID
            $('#PhoneNumer').val(result.PhoneNumer);
            $('#City').val(result.City);
            $('#Country').val(result.Country);
            $('#Status').val(result.Status);
            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}
//function for updating employee's record
function Update() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var empObj = {
        UserID: $('#UserID').val(),
        Name: $('#FullName').val(),
        EmailID: $('#EmailID').val(),
        PhoneNumer:$('#PhoneNumer').val(),
        City: $('#City').val(),
        Country: $('#Country').val(),
        Status: $('#Status').val()
    };
    $.ajax({
        url: "/User/Update",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            $('#UserID').val("");
            $('#FullName').val("");
            $('#PhoneNumer').val("");
            $('#EmailID').val("");
            $('#City').val("");
            $('#Country').val("");
            $('#Status').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//Function for clearing the textboxes
function clearTextBox() {
    $('#UserID').val("");
    $('#FullName').val("");
    $('#PhoneNumer').val("");
    $('#EmailID').val("");
    $('#City').val("");
    $('#Country').val("");
    $('#Status').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#FullName').css('border-color', 'lightgrey');
    $('#EmailID').css('border-color', 'lightgrey');
    $('#PhoneNumer').css('border-color', 'lightgrey');
    $('#City').css('border-color', 'lightgrey');
    $('#Country').css('border-color', 'lightgrey');
    $('#Status').css('border-color', 'lightgrey');
    //Valdidation using jquery
    function validate() {
        var isValid = true;
        if ($('#FullName').val().trim() == "") {
            $('#FullName').css('border-color', 'Red');
            isValid = false;
        }
        else {
            $('#FullName').css('border-color', 'lightgrey');
        }
        if ($('#PhoneNumber').val().trim() == "") {
            $('#PhoneNumber').css('border-color', 'Red');
            isValid = false;
        }
        else {
            $('#PhoneNumber').css('border-color', 'lightgrey');
        }
        if ($('#EmailID').val().trim() == "") {
            $('#EmailID').css('border-color', 'Red');
            isValid = false;
        }
        else {
            $('#EmailID').css('border-color', 'lightgrey');
        }
        if ($('#Password').val().trim() == "") {
            $('#Password').css('border-color', 'Red');
            isValid = false;
        }
        else {
            $('#Password').css('border-color', 'lightgrey');
        }
        if ($('#ReTypePassword').val().trim() == "") {
            $('#ReTypePassword').css('border-color', 'Red');
            isValid = false;
        }
        else {
            $('#ReTypePassword').css('border-color', 'lightgrey');
        }
        return isValid;
    }
}