// import { getMovie, getFavouriteMoviesByUserId } from "./getMovie.js"
import { getData } from "../handles/handles.js"
import { movieApi } from "../API/api.js"

const wrapFavouriteMovie = document.querySelector('.header__movie-wrap')
const nameUser = document.querySelector('.name-user')
const btnMore = document.querySelector('.btn-more')
const myReview = document.querySelector('.my-review')
const myFavourite = document.querySelector('.header__movie-list-item')
const countFavouriteMovie = document.querySelector('.header__movie-notice')

let userCurrent = JSON.parse(sessionStorage.getItem('currentUser'))
const movies = await getData(movieApi)
const getMovieByIdMovie = (id) => {
    return movies.find(movie => {
      return movie.id == id
    })
}


function renderHeaderFavouriteMovie(){
    let favoriteMovies = getData(`${movieApi}${userCurrent.id}/`)
    countFavouriteMovie.innerHTML = favoriteMovies.length
    let htmls = ""
    if(favoriteMovies) {
        favoriteMovies.forEach(favoriteMovie => {
            const movie = getMovieByIdMovie(favoriteMovie.id_movie)
            htmls += `<li class="header__movie-item">
            <img src=${movie.img} alt="movie" class="w-[50px] h-[50px]"/>
            <span class="header__movie-title text-black">${movie.name}</span>
        </li>`
        });
    }
    myFavourite.innerHTML = htmls
}

if(userCurrent) {
    wrapFavouriteMovie.style.display = "block"
    nameUser.innerHTML = userCurrent.username
    // renderHeaderFavouriteMovie()
    btnMore.addEventListener('click', function(e) {
        e.preventDefault()
        if(userCurrent) window.location.href = `http://127.0.0.1:5501/home/templates/src/pages/Movie/ViewMovieFavourite.html?id=${userCurrent.id}`;
        else window.location.href = `http://127.0.0.1:5501/home/templates/src/pages/Unsign/formSignIn.html`;
    })
} else {
    wrapFavouriteMovie.style.display = "none"
}

myReview.addEventListener('click', () => {
    window.location.assign("../../pages/Review/DetailReview.html")
})


export default userCurrent