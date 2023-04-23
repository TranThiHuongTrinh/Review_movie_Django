import {getInfor} from './index.js'


let name = document.getElementById('name')
let password = document.getElementById('password')
let email = document.getElementById('email')

name.value = getInfor().username
password.value = getInfor().password
email.value = getInfor().email
