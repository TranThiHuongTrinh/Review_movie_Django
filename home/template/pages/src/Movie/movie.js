const btnDelMovie = document.querySelectorAll('.del__movie')
const btnUpMovie = document.querySelectorAll('.update__movie')
const modal = document.querySelector('.modal')
const modalDel = document.querySelector('.modal__del')
const modalUp = document.querySelector('.modal__add')
const iconDel = document.querySelectorAll('.icon-close')
const openFormAdd = document.querySelector('.add__movie')
const titleForm = document.querySelector('.modal__title')
const btnForm = document.querySelector('.btn-form')

console.log(openFormAdd);

btnDelMovie.forEach(item => {
    item.addEventListener('click', () => {
        modal.classList.add('flex')
        modalDel.classList.add('flex')
    })
})

btnUpMovie.forEach(item => {
    item.addEventListener('click', () => {
        modal.classList.add('flex')
        modalUp.classList.add('block')
        titleForm.innerHTML = 'UPDATE MOVIE'
        btnForm.value = 'UPDATE'
    })
})

iconDel.forEach(item => {
    item.addEventListener('click', () => {
        modalDel.classList.remove('flex')
        modal.classList.remove('flex')
        modalUp.classList.remove('block')
    })
})

openFormAdd.addEventListener('click', () => {
    console.log(123);
    modal.classList.add('flex')
    modalUp.classList.add('block')
    titleForm.innerHTML = 'ADD MOVIE'
    btnForm.value = 'ADD'
})
