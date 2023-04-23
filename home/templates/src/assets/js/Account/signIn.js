import {submitSignInForm} from './index.js'

const submit_btn = document.querySelector('.signIn')
    
submit_btn.addEventListener('click', submitSignInForm, (event) => {
    event.preventDefault();
});



