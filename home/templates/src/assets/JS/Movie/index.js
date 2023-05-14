const wrapFavouriteMovie = document.querySelector('.header__movie-wrap')
const nameUser = document.querySelector('.name-user')
let userCurrent = JSON.parse(sessionStorage.getItem('currentUser'))

if(userCurrent) {
    wrapFavouriteMovie.style.display = "none"
    nameUser.innerHTML = userCurrent.username
} else {
    wrapFavouriteMovie.style.display = "block"
}

export default userCurrent