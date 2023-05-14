const listMovieHtml = document.querySelector('.content__movie-list')
const modal = document.querySelector('.modal')
const modalDel = document.querySelector('.modal__del')
const iconClose = document.querySelector('.icon-close')

const movieAPI = "http://localhost:3000/movies"
const favouriteMovieAPI = "http://localhost:3000/favouriteMovies"


function renderMovie(movie){
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
        </li>
    `
}

function showMovieList(listMovie){
    let htmls = ""
    htmls = listMovie.map(movie => renderMovie(movie))
    listMovieHtml.innerHTML = htmls.join('')
}

function openFormDel () {
    modal.classList.add('flex')
    modalDel.classList.add('flex')
}

iconClose.addEventListener('click', () => {
    modalDel.classList.remove('flex')
    modal.classList.remove('flex')
    modalUp.classList.remove('block')
})

async function getData(api){
    const response = await fetch(api);
    const jsonData = await response.json();
    return jsonData
}

async function getFavouriteMoviesByUserId(userId) {
    const [movies, favouriteMovies] = await Promise.all([getData(movieAPI), getData(favouriteMovieAPI)]);
    const favouriteMovieIds = favouriteMovies.filter(favMovie => favMovie.id_user === userId).map(favMovie => favMovie.id_movie);
    const favouriteMoviesData = movies.filter(movie => favouriteMovieIds.includes(movie.id));
    return favouriteMoviesData;
}
function getInfor() {
    const currentUser = JSON.parse(localStorage.getItem("currentUser"));
    // console.log(currentUser);
    return currentUser
}
const userId = getInfor().id;

getFavouriteMoviesByUserId(userId)
    .then(result => showMovieList(result));


