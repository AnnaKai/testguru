document.addEventListener('turbolinks:load', function() {
    var controls = document.querySelectorAll('.form-inline-link');

    if (controls.length ) {
        for (var i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
    }
});

function formInlineLinkHandler(e) {
    e.preventDefault();

    var testId = this.dataset.testid;
    formInlineHandler(testId);
}

function formInlineHandler(testId) {
    //`.form-inline-link[data-test-id=${testId}}`
    var link = document.querySelector('.form-inline-link[data-testid="' + testId + '"]');
    var testTitle = document.querySelector('.test-title[data-testid="' + testId + '"]');
    var formInline = document.querySelector('.form-inline[data-testid="' + testId + '"]');

    if(formInline.classList.contains('hide')) {
        testTitle.classList.add('hide');
        formInline.classList.remove('hide');
        link.textContent = 'Cancel';
    } else {
        testTitle.classList.remove('hide');
        formInline.classList.add('hide');
        link.textContent = 'Edit';
    }
}
