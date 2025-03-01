function calcNights() {
    var day_as_milliseconds = 86400000;
    var diff_in_millisenconds = new Date(document.getElementById("DateOut").value) - new Date(document.getElementById("DateIn").value);

    document.getElementById("lblNights").innerText = diff_in_millisenconds / day_as_milliseconds;

    calcTotal();
};

function calcPeople() {
    document.getElementById("lblPeople").innerText = parseInt(document.getElementById("txtAdults").value) + parseInt(document.getElementById("txtKids").value);

    calcTotal();
}

function calcTotal() {
    let price = parseInt(document.getElementById("lblPrice").innerText);
    let people = parseInt(document.getElementById("lblPeople").innerText);
    let nights = parseInt(document.getElementById("lblNights").innerText);

    document.getElementById("lblTotal").innerText = price * people * nights + 25;
}