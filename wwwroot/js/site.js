// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.
function update(i) {
    var cb = document.getElementById("cb" + i);
    var costBox = document.getElementById("cost");
    var am = Number(document.getElementById("am" + i).value);
    var current = Number(costBox.value);
    var rem = document.getElementById("rem");
    var remaining = Number(rem.value)
    var paid = Number(document.getElementById("paid").value);
    if (cb.checked) {
        remaining = remaining-current
        current += am;
        costBox.value = current;
        var currentRemaining = current + remaining;
        rem.value = currentRemaining;
    }
    else {
        current -= am;
        costBox.value = current;
        var currentRemaining = remaining - am;
        rem.value = currentRemaining;
    }

}

function getRemaining() {
    var cost = Number(document.getElementById("cost").value);
    var rem = document.getElementById("rem");
    var remaining = Number(rem.value)
    var paid = Number(document.getElementById("paid").value);
    var current = 0;
    if (cost == 0) {
        current = cost + remaining - paid;
        rem.value = current;
    }
    else {
        current = cost - paid;
        rem.value = current;
    }

    
}

// Write your JavaScript code.
