import {getMovie, getMovieByIdMovie} from "./getMovie.js"
import { delItem, addItem, updateItem } from "../handles/handles.js"

const modal = document.querySelector('.modal')
const modalDel = document.querySelector('.modal__del')
const modalUp = document.querySelector('.modal__add')
const titleForm = document.querySelector('.modal__title')
const btnForm = document.querySelector('.btn-form')
const movieFavourite = document.querySelector('.header__movie-wrap')
const btnMore = document.querySelector('.btn-more')

const listMovieHtml = document.querySelector('.content__movie-list')
let listMovie = await getMovie()
let idDel = 1
let idUp = 1
let idUser = 1
let checkUp = false
let movieUp = null
let pathImg = "http://127.0.0.1:5500/home/templates/src/assets/img/"

function getInfor() {
    const currentUser = JSON.parse(localStorage.getItem("currentUser"));
    return currentUser
}
// let isAdmin = getInfor().isAdmin
let isAdmin = false

const movieAPI = "http://localhost:3000/movies"



function renderMovieAdmin(movie){
    return `
        <li class="content__movie-item">
            <div class="content__movie-img group">
                <img src=${movie.img} alt="movie" style="width: 300px; height: 100%"/>
                <div class="icon-detail group-hover:block" data-id="${movie.id}">
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
            <button class="btn-small del__movie" data-id="${movie.id}">DELETE</button>
            <button class="btn-small update__movie" data-id="${movie.id}">UPDATE</button>
        </li>
    `
}

function renderMovieUser(movie){
    return `
        <li class="content__movie-item">
            <div class="content__movie-img group">
                <img src=${movie.img} alt="" style="width: 300px; height: 100%"/>
                <div class="icon-detail group-hover:block" data-id="${movie.id}">
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

const handleDel = (id) => {
    delItem(id, movieAPI)
    listMovie = listMovie.filter(movie => movie.id !== id)
    showMovieList(listMovie)
}

showMovieList(listMovie)

function openFormUp () {
    modal.classList.add('flex')
    modalUp.classList.add('block')
    titleForm.innerHTML = 'UPDATE MOVIE'
    btnForm.value = 'UPDATE'
}


// Del
function openFormDel () {
    modal.classList.add('flex')
    modalDel.classList.add('flex')
}

const btnsDel = document.querySelectorAll('.del__movie')
btnsDel.forEach(btn => {
    btn.addEventListener('click', function(e) {
        idDel = e.target.dataset.id;
        openFormDel()
    })
});

const btnsUpdate = document.querySelectorAll('.update__movie')
btnsUpdate.forEach(btn => {
    btn.addEventListener('click', function(e) {
        idUp = e.target.dataset.id
        loadDataForm(idUp)
        openFormUp()
    })
});

const btnYesDel = document.querySelector('.btn-yes')
btnYesDel.addEventListener('click', (e) => {
    handleDel(idDel)
})

// Get value input
const inputs = document.querySelectorAll('.input-form')
const selectGenre = document.querySelector('select')
const formAdd = document.querySelector('form')
const checkInputs = () => {
    let check = true
    inputs.forEach((input, index) => {
        if(index == 1 && checkUp == true){
            //Do nothing
        } else {
            if(!input.value) check = false
        }
    })
    return check
}

const imgMovie = document.querySelector('.movie-img')
const inputImg = document.querySelector('.input-img')
inputImg.addEventListener('change', showPreview)

function showPreview(event) {
    if(event.target.files.length > 0){
        console.log(URL.createObjectURL(event.target.files[0]), "123");
        let src = URL.createObjectURL(event.target.files[0])
        imgMovie.src = src
    }
}

const getValueInput = () => {
    let name = inputs[0].value
    let genre = selectGenre.value
    inputs[1].style.display = "inline-block"
    let img_src = pathImg + inputs[1].files[0].name
    let decription = inputs[2].value
    const url = inputs[3].value;
    const videoId = url.split('/').pop();
    let link_video = "https://www.youtube.com/embed/" + videoId
    let runtime = inputs[4].value
    let release = inputs[5].value
    return [name, genre, img_src, decription, link_video, runtime, release]
}

// Add item
const handleSubmit = () => {
    if(checkInputs()) {
        const [name, genre, img_src, decription,  link_video, runtime, release] = getValueInput()
        const data = {
            "name": name,
            "genre": genre,
            "description": decription,
            "image": img_src,
            "link_video": link_video,
            "run_time": runtime,
            "release": release,
          }
        if(checkUp == false) addItem(data, movieAPI)
        else updateItem(idUp, data, movieAPI)
    } else {
        alert('Nhập đầy đủ thông tin')
    }
}


formAdd.addEventListener('submit', (e) => {
    console.log(formAdd);
    e.preventDefault()
    handleSubmit()
    return false;
})

// Update item

// load data form
const loadDataForm = (id) => {
    checkUp = true
    const movie = getMovieByIdMovie(id)
    movieUp = movie
    inputs[0].value = movie.name
    selectGenre.value = movie.genre
    imgMovie.style.display = "inline-block"
    imgMovie.src = movie.img
    inputs[2].value = movie.decription
    inputs[3].value = movie.link
    inputs[4].value = movie.runtime
    inputs[5].value = movie.release
}

// Search
const inputSearch = document.querySelector('.input-search')
inputSearch.addEventListener("input", (e) => {
    if(e.target.value != ""){
        const newListMovie = listMovie.filter(movie => movie.name.toLowerCase().includes(e.target.value.toLowerCase()))
        showMovieList(newListMovie)
    } else {
        showMovieList(listMovie)
    }
})

// Chuyển hướng đến detail movie

const btnsDetail = document.querySelectorAll('.icon-detail')
btnsDetail.forEach(btnDetail => {
    btnDetail.addEventListener('click', (e) => {
        const id = btnDetail.getAttribute("data-id");
        window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Movie/DetailMovie.html?id=${id}`;
    })
})






console.log(btnMore);
btnMore.addEventListener('click', function(e) {
    e.preventDefault()
    window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Movie/ViewMovieFavourite.html?id=${idUser}`;
})