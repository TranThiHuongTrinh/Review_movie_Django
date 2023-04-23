import {getInfor} from './index.js'

const name_user = document.querySelector('.name-user')

name_user.innerHTML = (getInfor().username).toUpperCase()
