const wrapFavouriteMovie = document.querySelector('.header__movie-wrap')
const nameUser = document.querySelector('.name-user')
const btnMore = document.querySelector('.btn-more')
const myReview = document.querySelector('.my-review')

let userCurrent = JSON.parse(sessionStorage.getItem('currentUser'))

if(userCurrent) {
    wrapFavouriteMovie.style.display = "block"
    nameUser.innerHTML = userCurrent.username
    btnMore.addEventListener('click', function(e) {
        e.preventDefault()
        if(userCurrent) window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Movie/ViewMovieFavourite.html?id=${userCurrent.id}`;
        else window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Unsign/formSignIn.html`;
    })
} else {
    wrapFavouriteMovie.style.display = "none"
}

myReview.addEventListener('click', () => {
    window.location.assign("../../pages/Review/DetailReview.html")
})


export default userCurrent