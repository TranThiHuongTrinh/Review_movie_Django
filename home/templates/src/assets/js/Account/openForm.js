const account = document.querySelector('.account')

console.log(account);

account.addEventListener('click', function (e) {
    e.preventDefault()
    window.location.href = ("http://127.0.0.1:5500/home/templates/src/pages/Account/account.html");
})