document.addEventListener('turbolinks:load', function () {
    var bar = document.querySelector('.progress-bar');
    var percent = bar.dataset.percent;
    var filled = document.querySelector('.progress-bar[data-percent="' + percent + '"]');
    filled.style.width = percent + "%";
});
