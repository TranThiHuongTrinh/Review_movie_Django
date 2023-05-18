import { getMovie, getFavouriteMoviesByIdUser } from "./getMovie.js"

const wrapFavouriteMovie = document.querySelector('.header__movie-wrap')
const nameUser = document.querySelector('.name-user')
const btnMore = document.querySelector('.btn-more')
const myReview = document.querySelector('.my-review')
const myFavMovie = document.querySelector('.header__movie-list-item')
const myFavMovieLength = document.querySelector('.header__movie-notice')
const myAccount = document.querySelector('.account')
const backHome = document.querySelector('.back-home')
const heart = document.querySelector('.header__movie-wrap')

let userCurrent = JSON.parse(sessionStorage.getItem('currentUser'))
let isAdmin = userCurrent ? userCurrent.is_superuser : false
const movies = await getMovie()

const moviesByFavouriteMovies = []

backHome.addEventListener('click', () => {
    window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Unsign/homepage.html`;
})

function render3FavoriteMovies(moviesByFavouriteMovies) {
    let htmls = ""
    moviesByFavouriteMovies.forEach((movie, index) => {
        if(index < 3) {
            htmls += `
                <li class="header__movie-item">
                    <img src=${movie.image} alt="movie" style="width: 50px; height: 50px"/>
                    <span class="header__movie-title text-black">${movie.name}</span>
                </li>
            `
        }
    });
    myFavMovie.innerHTML = htmls
    myFavMovieLength.innerHTML = moviesByFavouriteMovies.length
}


if(userCurrent) {
    wrapFavouriteMovie.style.display = "block"
    nameUser.innerHTML = userCurrent.username
    btnMore.addEventListener('click', function(e) {
        e.preventDefault()
        if(userCurrent) window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Movie/ViewMovieFavourite.html?id=${userCurrent.id}`;
        else window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Unsign/formSignIn.html`;
    })
    const favouriteMovies = await getFavouriteMoviesByIdUser(userCurrent.id)
    favouriteMovies.forEach(favouriteMovie => {
        moviesByFavouriteMovies.push(movies.find(movie => movie.id == favouriteMovie.movie))
    })
    

} else {
    wrapFavouriteMovie.style.display = "none"
}

if(isAdmin) {
    myReview.style.display = "none"
    heart.style.display = "none"
} else {
    myReview.style.display = "flex"
    heart.style.display = "block"
}

render3FavoriteMovies(moviesByFavouriteMovies)


myReview.addEventListener('click', () => {
    window.location.assign("../../pages/Review/DetailReview.html")
})

myAccount.addEventListener('click', () => {
    window.location.assign("../../pages/Account/account.html")
})


export default userCurrent