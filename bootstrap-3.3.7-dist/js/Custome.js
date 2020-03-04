function accessingcompanyemail() {
    $("#v2").modal({
        show: false,
        backdrop: 'static'

    });
    $('#V2').modal("show");
}
function buy() {
    $("#V3").modal({
        show: false,
        backdrop: 'static'

    });
    $('#V3').modal("show");
}
function part() {
    $("#partially").modal({
        show: false,
        backdrop: 'static'

    });
    $('#partially').modal("show");
}
function dev() {
    $("#underdev").modal({
        show: false,
        backdrop: 'static'

    });
    $('#underdev').modal("show");
}
function system() {
    $("#v4").modal({
        show: false,
        backdrop: 'static'

    });
    $('#v4').modal("show");
}
function recipt() {
    $("#v45").modal({
        show: false,
        backdrop: 'static'

    });
    $('#v45').modal("show");
}
function balancess() {
    $("#stubborn").modal({
        show: false,
        backdrop: 'static'

    });
    $('#stubborn').modal("show");
}
function arrears() {
    $("#v46").modal({
        show: false,
        backdrop: 'static'

    });
    $('#v46').modal("show");
}

    function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;

}
