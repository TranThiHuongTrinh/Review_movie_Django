const btnSignIn = document.querySelector('.signin')
const user = JSON.parse(sessionStorage.getItem("currentUser"));
const headerAccNav = document.querySelector('.header__navbar')
if (user) {
    btnSignIn.classList.add('hidden')
    headerAccNav.classList.remove('hidden')
} else {
    btnSignIn.classList.remove('hidden')
    headerAccNav.classList.add('hidden')
}