function calcNights()
{
    var day_as_milliseconds = 86400000;
    var diff_in_millisenconds = new Date(document.getElementById("DateOut").value) - new Date(document.getElementById("DateIn").value);    
    
    document.getElementById("lblNights").innerText = diff_in_millisenconds / day_as_milliseconds;
};