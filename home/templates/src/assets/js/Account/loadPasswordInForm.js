import {getInfor} from './index.js'


let password = document.getElementById('password')
let new_password = document.getElementById('new_password')
let confirm_password = document.getElementById('confirm_password')

password.value = getInfor().password
