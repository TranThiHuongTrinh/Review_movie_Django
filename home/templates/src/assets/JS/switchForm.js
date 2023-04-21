const headingForm_text = document.querySelector('.form-heading')
const headingIntroduce_text = document.querySelector('.introduce-heading')
const submit_btn = document.querySelector('input[type="submit"]')
const forgetPassword_btn = document.querySelector('.forget-password')
const switch_btn = document.querySelector('.switch')
const formContainer = document.querySelector('.form-container')
const switchContainer = document.querySelector('.switch-container')
const name = document.querySelector('input[placeholder="Name"]')
const retype = document.querySelector('input[placeholder="Re-type Password"]')
let isSignIn = false
switch_btn.addEventListener('click', function (e) {
    e.preventDefault()
    setTimeout(function () {
        name.classList.toggle('hidden')
        retype.classList.toggle('hidden')
        forgetPassword_btn.classList.toggle('hidden')
    }, 200)

    if (isSignIn) {
        formContainer.classList.remove('translate-x-[384px]')
        switchContainer.classList.remove('-translate-x-[1152px]')
        setTimeout(function () {
            headingForm_text.innerHTML = "LOGIN TO YOUR ACCOUNT"
            headingIntroduce_text.innerHTML = "NEW HERE ?"
            switch_btn.innerHTML = "Sign Up"
            submit_btn.value = "Sign In"
        }, 200)
        isSignIn = false
    }
    else {
        formContainer.classList.add('translate-x-[384px]')
        switchContainer.classList.add('-translate-x-[1152px]')
        setTimeout(function () {
            headingForm_text.innerHTML = "CREATE YOUR ACCOUNT"
            headingIntroduce_text.innerHTML = "ALREADY HAVE ?"
            switch_btn.innerHTML = "Sign In"
            submit_btn.value = "Sign Up"
        }, 200)
        isSignIn = true
    }

})
submit_btn.addEventListener('click', function (e) {
    e.preventDefault()
    console.log("submit nè");
})