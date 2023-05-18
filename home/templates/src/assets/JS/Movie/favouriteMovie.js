import {getMovie, getFavouriteMoviesByIdUser} from './getMovie.js'

const listMovieHtml = document.querySelector('.content__movie-list')
const modal = document.querySelector('.modal')
const modalDel = document.querySelector('.modal__del')
const iconClose = document.querySelector('.icon-close')
const params = new URLSearchParams(window.location.search);
const userId = params.get('id');

const movies = await getMovie()
const favouriteMoviesByIdUser = await getFavouriteMoviesByIdUser(userId)


function renderMovie(movie){
    return `
        <li class="content__movie-item">
            <div class="content__movie-img group">
                <img src=${movie.image} alt="movie" style="width: 300px; height: 100%"/>
                <div class="icon-detail group-hover:block">
                    <i class="fa-solid fa-circle-info text-3xl icon-more"></i>
                </div>
            </div>
            <div class="movie__info">
                <div class="movie__rating">
                    <h1 class="movie__name">${movie.name}</h1>
                    <div>
                        <i class="fa-solid fa-tomato icon-tomato"></i>
                        <span class="text-2xl">7.4/10</span>
                    </div>
                </div>
                <ul class="movie__genre">
                    <li>Genre : </li>
                    <li class="movie__genre-item bg-[#1692BB]">SCI-FI</li>
                    <li class="movie__genre-item bg-[#F5B50A]">${movie.genre}</li> 
                </ul>
                <p class="movie__decription">
                    ${movie.description}
                </p>
            </div>
        </li>
    `
}

function showMovieList(listMovie){
    let htmls = ""
    htmls = listMovie.map(movie => renderMovie(movie))
    listMovieHtml.innerHTML = htmls.join('')
}


iconClose.addEventListener('click', () => {
    modalDel.classList.remove('flex')
    modal.classList.remove('flex')
    modalUp.classList.remove('block')
})


let moviesByFavouriteMovies = []

favouriteMoviesByIdUser.forEach(favouriteMovie => {
    const movie = movies.find(movie => movie.id == favouriteMovie.movie)
    moviesByFavouriteMovies.push(movie)
});

showMovieList(moviesByFavouriteMovies)

