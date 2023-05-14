import {submitSignInForm, submitSignUpForm} from './index.js'

const submit_btn = document.querySelector('input[type="submit"]')
const email = document.querySelector('#email')
const password = document.querySelector('#password')
const username = document.querySelector('#name')
const re_password = document.querySelector('#re-password')
let data = {}
    
submit_btn.addEventListener('click', (event) => {
    event.preventDefault();
    console.log(submit_btn.classList.contains('signUp'));
    if(submit_btn.classList.contains('signIn')) {
        submitSignInForm()
    }
    if(submit_btn.classList.contains('signUp')) {
        if(password.value === re_password.value) {
            data = {
                "id": '',
                "email": email.value,
                "username": username.value,
                "password": password.value,
                "img": "../../assets/img/acc.png",
                "isAdmin": false
            }
            submitSignUpForm(data)
        }
        else {
            alert("The password not match")
        }
    }
});



