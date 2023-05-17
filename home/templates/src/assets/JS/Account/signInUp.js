import { submitSignInForm, submitSignUpForm } from './index.js'
import { isEmpty, isValidEmail, minLength } from '../Validate/validate.js'

const submit_btn = document.querySelector('input[type="submit"]')
const email = document.querySelector('#email')
const password = document.querySelector('#password')
const username = document.querySelector('#name')
const re_password = document.querySelector('#re-password')
const errName = document.querySelector('.errName')
const errEmail = document.querySelector('.errEmail')
const errPassword = document.querySelector('.errPassword')
const errRePassword = document.querySelector('.errRePassword')
let data = {}

username.addEventListener('change', (e) => {
    e.preventDefault();
    if (isEmpty(username.value)) {
        errName.innerHTML = "Please enter your name!"
    }
    else {
        errName.innerHTML = ""
    }
})
email.addEventListener('change', (e) => {
    e.preventDefault();
    if (isEmpty(email.value) || !isValidEmail(email.value)) {
        errEmail.innerHTML = "Invalid email!"
    }
    else {
        errEmail.innerHTML = ""
    }
})
password.addEventListener('change', (e) => {
    e.preventDefault();
    if (isEmpty(password.value) || !minLength(password.value, 6)) {
        errPassword.innerHTML = "Invalid password!"
    }
    else {
        errPassword.innerHTML = ""
    }
})
re_password.addEventListener('change',   (e) => {
    e.preventDefault();
    if (password.value === re_password.value) {
        errRePassword.innerHTML = ""
    }
    else {
        errRePassword.innerHTML = "The password not match"
    }
})
submit_btn.addEventListener('click', (e) => {
    e.preventDefault();
    if (submit_btn.classList.contains('signIn')) {
        if (!isValidEmail(email.value)) {
            errEmail.innerHTML = "Invalid email!"
        }
        else {
            errEmail.innerHTML = ""
        }
        if (!minLength(password.value, 6)) {
            errPassword.innerHTML = "Invalid password!"
        }
        else {
            errPassword.innerHTML = ""
        }
        if(!isEmpty(email.value) && !isEmpty(password.value)) {
            submitSignInForm(e, email.value, password.value)
        }
        else {
            errEmail.innerHTML = "Enter email"
            errPassword.innerHTML = "Enter password"
        }
    }
    if (submit_btn.classList.contains('signUp')) {
        if (!isValidEmail(email.value)) {
            errEmail.innerHTML = "Invalid email!"
        }
        else {
            errEmail.innerHTML = ""
        }
        if (!minLength(password.value, 6)) {
            errPassword.innerHTML = "Invalid password!"
        }
        else {
            errPassword.innerHTML = ""
        }
        if (password.value !== re_password.value) {
            errRePassword.innerHTML = "The password not match"
        }
        else {
            errRePassword.innerHTML = ""
        }
        if(!isEmpty(username.value) && !isEmpty(password.value) && !isEmpty(email.value) && !isEmpty(re_password.value)) {
            data = {
                "password": password.value,
                "is_superuser": false,
                "username": username.value,
                "email": email.value,
                "img": "../../assets/img/acc.png"
            }
            submitSignUpForm(e, data)
        }
        else {
            errName.innerHTML = "Enter username"
            errEmail.innerHTML = "Enter email"
            errRePassword.innerHTML = "Enter re-password"
            errPassword.innerHTML = "Enter password"
        }
    }
});



