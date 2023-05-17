import {getInfor, handleEdit} from './index.js'

const acc = JSON.parse(sessionStorage.getItem("currentUser"))
const submitBtn = document.querySelector('.save_btn')
let data = {}

let password = document.getElementById('password')
let new_password = document.getElementById('new_password')
let confirm_password = document.getElementById('confirm_password')

password.value = getInfor().password

submitBtn.addEventListener("click", (e) => {
    e.preventDefault();
    if(new_password.value === confirm_password.value) {
        data = {
            "id": acc.id,
            "email": acc.email,
            "username": acc.username,
            "password": new_password.value,
            "img": acc.img,
            "is_superuser": acc.is_superuser
        }
        handleEdit(data)
    }
    else {
        alert("Wrong password")
    }
})