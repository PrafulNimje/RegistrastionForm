$document.addEventListener('DOMContentLoaded', function () {
    var forms = document.querySelectorAll('.needs-validation');
    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
});

$(() => {
    // Give .js-datetimepicker to the input field or wrapper element. 
    // When you click on the element that has this class, the datetimepicker pops up.
    $('.js-datetimepicker').datetimepicker();
});


