const account = document.querySelector('.account')

account.addEventListener('click', function (e) {
    e.preventDefault()
    window.location.href = ("http://127.0.0.1:5501/home/templates/src/pages/Account/account.html");
})