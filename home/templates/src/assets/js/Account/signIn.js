import {submitSignInForm} from './index.js'

const submit_btn = document.querySelector('input[type="submit"]')
    
submit_btn.addEventListener('click', (event) => {
    event.preventDefault();
    submitSignInForm()
});



