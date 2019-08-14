document.addEventListener('turbolinks:load', function () {
    var input1 = document.querySelector('.password');
    var input2 = document.querySelector('.password-confirmation');

    if (input1 && input2) {
        input1.addEventListener('input', validatePasses);
        input1.addEventListener('keyup', validatePasses);
        input2.addEventListener('input', validatePasses);
        input2.addEventListener('keyup', validatePasses);
    }

    function validatePasses() {
        if (input2.value !== input1.value && input2.value !== '') {
            input1.style.borderColor = "red";
            input2.style.borderColor = "red";
        } else if (input2.value === input1.value && input2.value !== '') {
            input1.style.borderColor = "green";
            input2.style.borderColor = "green"
        } else {
            input1.style.borderColor = "#ced4da";
            input2.style.borderColor = "#ced4da";
        }
    }
});
