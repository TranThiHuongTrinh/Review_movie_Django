import {getMovie,getMovieByIdMovie} from "./getMovie.js"
import { delItem, addItem, updateItem } from "../handles/handles.js"
import userCurrent from "./index.js"
import { movieApi } from "../API/api.js"
import { renderListPage } from "../Pagination/index.js"
import renderRating from "../Rating/showRating.js"

const modal = document.querySelector('.modal')
const modalDel = document.querySelector('.modal__del')
const modalUp = document.querySelector('.modal__add')
const titleForm = document.querySelector('.modal__title')
const btnForm = document.querySelector('.btn-form')
const movieFavourite = document.querySelector('.header__movie-wrap')
const add_btn = document.querySelector('.add__movie')

const prev_btn = document.getElementById('prev_link')
const next_btn = document.getElementById('next_link')

const listMovieHtml = document.querySelector('.content__movie-list')
let listMovie = await getMovie(movieApi)
let idDel = 1
let idUp = 1
let idUser = null
if(userCurrent) idUser = userCurrent.id
let checkUp = false
let pathImg = "../../assets/img/"
let movieUp = null

let isAdmin = userCurrent ? userCurrent.is_superuser : false

let perPage = 10
let currentPage = 1
let start = 0
let end = perPage
let totalPages = 0

totalPages = Math.ceil(listMovie.length / perPage)
renderListPage(totalPages)

function renderMovieAdmin(movie){
    return `
        <li class="content__movie-item">
            <div class="content__movie-img group">
                <img src=${movie.image} alt="movie" style="width: 300px; height: 100%"/>
                <div class="icon-detail group-hover:block" data-id="${movie.id}">
                    <i class="fa-solid fa-circle-info text-3xl icon-more"></i>
                </div>
            </div>
            <div class="movie__info">
                <div class="movie__rating">
                    <h1 class="movie__name">${movie.name}</h1>
                    <div style="display:flex; align-items: center; gap: 10px;">
                        <img src="../.././assets/img/tomato.png" alt="" style="max-width: 40px;"/>
                        <span class="text-2xl"><span class="rating-text" id=${movie.id}></span>/5</span>
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
            <button class="btn-small del__movie" data-id="${movie.id}">DELETE</button>
            <button class="btn-small update__movie" data-id="${movie.id}">UPDATE</button>
        </li>
    `
}

function renderMovieUser(movie){
    add_btn.style.display = 'none'
    return `
        <li class="content__movie-item justify-normal gap-[150px]" style="justify-content: space-around">
            <div class="content__movie-img group">
                <img src=${movie.image} alt="" style="width: 300px; height: 100%"/>
                <div class="icon-detail group-hover:block" data-id="${movie.id}">
                    <i class="fa-solid fa-circle-info text-3xl icon-more"></i>
                </div>
            </div>
            <div class="movie__info">
                <div class="movie__rating">
                    <h1 class="movie__name">${movie.name}</h1>
                    <div style="display:flex; align-items: center; gap: 10px;">
                        <img src="../.././assets/img/tomato.png" alt="" style="max-width: 40px;"/>
                        <span class="text-2xl"><span class="rating-text" id=${movie.id}></span>/5</span>
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
    if(isAdmin == true){
        movieFavourite.style.display = "none"
        htmls = listMovie.slice(start, end).reverse().map(movie => renderMovieAdmin(movie))
    } else {
        movieFavourite.style.display = "block"
        htmls = listMovie.slice(start, end).reverse().map(movie => renderMovieUser(movie))

    }
    listMovieHtml.innerHTML = htmls.join('')
}

const handleDel = (id) => {
    delItem(`${movieApi}delete/${id}/`)
    listMovie = listMovie.filter(movie => movie.id != id)
    showMovieList(listMovie)
    alert('Movie deleted successfully')
}

showMovieList(listMovie)

const wrapFavouriteMovie = document.querySelector('.header__movie-wrap')
if(userCurrent) {
    wrapFavouriteMovie.style.display = "block"
} else {
    wrapFavouriteMovie.style.display = "none"
}

function openFormUp () {
    modal.classList.add('flex')
    modalUp.classList.add('block')
    titleForm.innerHTML = 'UPDATE MOVIE'
    btnForm.value = 'UPDATE'
}

function closeForm () {
    modalDel.classList.remove('flex')
    modal.classList.remove('flex')
    modalUp.classList.remove('block')
}


const btnsDel = document.querySelectorAll('.del__movie')
btnsDel.forEach(btn => {
    btn.addEventListener('click', function(e) {
        idDel = e.target.dataset.id;
        handleDel(idDel)
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
    closeForm()
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



const getValueInput = () => {
    let name = inputs[0].value
    let genre = selectGenre.value
    inputs[1].style.display = "inline-block"
    let img_src = ""
    if(inputs[1].files[0]) {
        img_src = pathImg + inputs[1].files[0].name
    }
    else {
        if(checkUp) img_src = movieUp.image
    }
    let decription = inputs[2].value
    const url = inputs[3].value;
    const videoId = url.split('/').pop();
    let link_video = "https://www.youtube.com/embed/" + videoId
    let runtime = inputs[4].value
    let release = inputs[5].value
    return [name, genre, img_src, decription, link_video, runtime, release]
}

function isValidTimeFormat(str) {
    const regex = /^[0-9]+h[0-9]+p$/;
    return regex.test(str);
  }
  


// Add item
const handleSubmit = () => {
    if(checkInputs()) {
        if (isValidTimeFormat(inputs[4].value) == false) {
            alert('Please enter a valid time (exp: 1h20p)')
        }
        else {
            const [name, genre, img_src, decription,  link_video, runtime, release] = getValueInput()
            const data = {
                "name": name,
                "genre": genre,
                "description": decription,
                "image": img_src,
                "link_video": link_video,
                "run_time": runtime,
                "release": release
            }
            if(checkUp == false) {
                addItem(data, `${movieApi}add/`)
                listMovie.push(data)
            }
            else {
                updateItem(data, `${movieApi}update/${idUp}/`)
                listMovie = listMovie.map(movie => movie.id == idUp ? data : movie)
                checkUp = false
            }
            closeForm()
            // showMovieList(listMovie)
            window.location.reload()
        }
    } else {
        alert('Nhập đầy đủ thông tin')
    }
}


formAdd.addEventListener('submit', (e) => {
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
    inputs[1].src = movie.image
    inputs[2].value = movie.description
    inputs[3].value = movie.link_video
    inputs[4].value = movie.run_time
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
        const id = btnDetail.getAttribute('data-id');   
        if(idUser) window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Movie/DetailMovie.html?id=${id}`;
        else window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Unsign/formSignIn.html`;
    })
})

next_btn.addEventListener('click', () => {
    currentPage++
    if (currentPage > totalPages) {
        currentPage = totalPages
    }
    if (currentPage === totalPages) {
        next_btn.classList.add('text-[#666]')
        next_btn.classList.remove('cursor-pointer')
        next_btn.classList.remove('from-[#585858]')
        next_btn.classList.remove('hover:text-white')
        next_btn.classList.remove('to-[#111]')
    }
    prev_btn.classList.remove('text-[#666]')
    prev_btn.classList.add('cursor-pointer')
    prev_btn.classList.add('to-[#111]')
    prev_btn.classList.add('from-[#585858]')
    prev_btn.classList.add('hover:text-white')
    start = (currentPage - 1) * perPage
    end = currentPage * perPage
    showMovieList(listMovie)
    const ratingTexts = document.querySelectorAll('.rating-text')
    ratingTexts.forEach(rating => {
        renderRating(rating.id, rating)
    })
})
prev_btn.addEventListener('click', () => {
    currentPage--
    if (currentPage < 1) {
        currentPage = 1
    }
    if (currentPage === 1) {
        prev_btn.classList.add('text-[#666]')
        prev_btn.classList.remove('cursor-pointer')
        prev_btn.classList.remove('to-[#111]')
        prev_btn.classList.remove('from-[#585858]')
        prev_btn.classList.remove('hover:text-white')
    }
    next_btn.classList.remove('text-[#666]')
    next_btn.classList.add('cursor-pointer')
    next_btn.classList.add('from-[#585858]')
    next_btn.classList.add('hover:text-white')
    next_btn.classList.add('to-[#111]')
    start = (currentPage - 1) * perPage
    end = currentPage * perPage

    showMovieList(listMovie)
    const ratingTexts = document.querySelectorAll('.rating-text')
    ratingTexts.forEach(rating => {
        renderRating(rating.id, rating)
    })
})

const ratingTexts = document.querySelectorAll('.rating-text')
ratingTexts.forEach(rating => {
    renderRating(rating.id, rating)
})