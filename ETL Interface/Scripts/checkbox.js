function checkAll(element) {
    var check = element.checked;
    if (check) {
        document.getElementById("checkasm9").checked = true;
        document.getElementById("checkvwm").checked = true;
        document.getElementById("checkgnp").checked = true;
        document.getElementById("checkgm").checked = true;
        //
        //alert($("[id$='lbltxt']").html());
    }
    else {
        document.getElementById("checkasm9").checked = false;
        document.getElementById("checkvwm").checked = false;
        document.getElementById("checkgnp").checked = false;
        document.getElementById("checkgm").checked = false;
    }
}
function checkEtl(element) {
    var check1 = document.getElementById("checkasm9").checked;
    var check2 = document.getElementById("checkvwm").checked;
    var check3 = document.getElementById("checkgnp").checked;
    var check4 = document.getElementById("checkgm").checked;
    if (check1 && check2 && check3 && check4) document.getElementById("checkall").checked = true;
    else document.getElementById("checkall").checked = false;
}