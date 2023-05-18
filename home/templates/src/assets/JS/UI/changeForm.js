import setValueInputEmpty from "../Movie/setEmptyInput.js"

const openFormAdd = document.querySelector('.add__movie')
const iconCloseList = document.querySelectorAll('.icon-close')
const modal = document.querySelector('.modal')
const modalDel = document.querySelector('.modal__del')
const modalUp = document.querySelector('.modal__add')
const btnNo = document.querySelector('.btn-no')
const titleForm = document.querySelector('.modal__title')
const btnForm = document.querySelector('.btn-form')


const inputMovie = document.querySelector('.input-img')
openFormAdd.addEventListener('click', () => {
    setValueInputEmpty()
    modal.classList.add('flex')
    modalUp.classList.add('block')
    titleForm.innerHTML = 'ADD MOVIE'
    btnForm.value = 'ADD'
})

iconCloseList.forEach(iconClose => {
    iconClose.addEventListener('click', () => {
        modalDel.classList.remove('flex')
        modal.classList.remove('flex')
        modalUp.classList.remove('block')
    })
})

btnNo.addEventListener('click', (e) => {
    modalDel.classList.remove('flex')
    modal.classList.remove('flex')
    modalUp.classList.remove('block')
})

