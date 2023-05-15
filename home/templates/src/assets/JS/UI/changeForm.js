const listIconMore = document.querySelectorAll('.icon-more')
const openFormAdd = document.querySelector('.add__movie')
const iconCloseList = document.querySelectorAll('.icon-close')
const modal = document.querySelector('.modal')
const modalDel = document.querySelector('.modal__del')
const modalUp = document.querySelector('.modal__add')
const btnNo = document.querySelector('.btn-no')


const inputMovie = document.querySelector('.input-img')
openFormAdd.addEventListener('click', () => {
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

// listIconMore.forEach(iconMore => {
//     iconMore.addEventListener('click', () => {
//         window.location.assign("../../pages/Movie/DetailMovie.html")
//     })
// })

btnNo.addEventListener('click', (e) => {
    modalDel.classList.remove('flex')
    modal.classList.remove('flex')
    modalUp.classList.remove('block')
})

