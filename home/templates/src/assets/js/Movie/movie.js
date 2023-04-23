const modal = document.querySelector('.modal')
const modalDel = document.querySelector('.modal__del')
const modalUp = document.querySelector('.modal__add')
const titleForm = document.querySelector('.modal__title')
const btnForm = document.querySelector('.btn-form')
const movieFavourite = document.querySelector('.header__movie-wrap')
const listInput = document.querySelectorAll('.input-text')
const genreMovieinput = document.querySelector('.select-genre')
const btnMore = document.querySelector('.btn-more')

const listMovieHtml = document.querySelector('.content__movie-list')
let listMovie = []
function getInfor() {
    const currentUser = JSON.parse(localStorage.getItem("currentUser"));
    // console.log(currentUser);
    return currentUser
}
let isAdmin = getInfor().isAdmin
console.log(isAdmin);

const movieAPI = "http://localhost:3000/movies"

function getData(callback){
    fetch(movieAPI)
    .then(function (response) {
        return response.json()
    })
    .then(function (response) {
        listMovie = response
        
        return response
    })
    .then(callback)
}

function renderMovieAdmin(movie){
    return `
        <li class="content__movie-item">
            <div class="content__movie-img group">
                <img src=${movie.img} alt="movie" style="width: 300px; height: 100%"/>
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
                    ${movie.decription}
                </p>
            </div>
            <button class="btn-small del__movie" onclick="openFormDel()">DELETE</button>
            <button class="btn-small update__movie" onclick="openFormUp()">UPDATE</button>
        </li>
    `
}

function renderMovieUser(movie){
    return `
        <li class="content__movie-item">
            <div class="content__movie-img group">
                <img src=${movie.img} alt="" style="width: 300px; height: 100%"/>
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
                    ${movie.decription}
                </p>
            </div>
        </li>
    `
}

function showMovieList(listMovie){
    let htmls = ""
    if(isAdmin == true){
        movieFavourite.style.display = "none"
        htmls = listMovie.map(movie => renderMovieAdmin(movie))
    } else {
        movieFavourite.style.display = "block"
        htmls = listMovie.map(movie => renderMovieUser(movie))

    }
    listMovieHtml.innerHTML = htmls.join('')
}

function createMovie(data, callback){
    fetch(movieAPI, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(callback);
}

function main() {
    try {
        getData(showMovieList)
    } catch (error) {
        alert("Loading failed")
    } finally {
    }
}

main()


function openFormDel () {
    modal.classList.add('flex')
    modalDel.classList.add('flex')
}

function openFormUp () {
    modal.classList.add('flex')
    modalUp.classList.add('block')
    titleForm.innerHTML = 'UPDATE MOVIE'
    btnForm.value = 'UPDATE'
}

btnMore.addEventListener('click', function(e) {
    e.preventDefault()
    window.location.href = "http://127.0.0.1:5500/home/templates/src/pages/Movie/ViewMovieFavourite.html";
})