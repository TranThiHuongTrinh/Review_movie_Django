import {getInfor, handleEdit} from './index.js'


const name = document.getElementById('name')
const password = document.getElementById('password')
const email = document.getElementById('email')
const submitBtn = document.querySelector('.save_btn')
const ava_input = document.querySelector('#ava-input')
const ava_img = document.querySelector('.ava')
const upload = document.querySelector('.browse-img')
const acc = JSON.parse(localStorage.getItem("currentUser"))
let imgUrl = ''
let data = {}

ava_img.src = getInfor().img
name.value = getInfor().username
password.value = getInfor().password
email.value = getInfor().email

ava_input.addEventListener('change', () => {
    imgUrl = `../../assets/img/${ava_input.files[0].name}`
    ava_img.src = imgUrl
})

submitBtn.addEventListener("click", (e) => {
    e.preventDefault();
    data = {
        "id": acc.id,
        "email": acc.email,
        "username": name.value,
        "password": acc.password,
        "img": imgUrl,
        "isAdmin": acc.isAdmin
    }
    handleEdit(data)
})