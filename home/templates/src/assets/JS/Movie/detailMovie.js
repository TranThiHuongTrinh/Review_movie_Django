import {getData ,addItem, delItem } from '../handles/handles.js'
import { movieApi, reviewMovieApi, favouriteMovieAPI , reviewApi } from '../API/api.js'
import userCurrent from './index.js'

const movieInfo = document.querySelector('.movie__info-container')
const params = new URLSearchParams(window.location.search);
const idMovie = params.get('id');
const movie = await getData(`${movieApi}${idMovie}/`)
const previewMovie = document.querySelector('.preview__movie-youtube')
const reviewsByIdMovie = await getData(`${reviewMovieApi}${idMovie}/`)
const reviewContainer = document.querySelector('.movie__review-list')
const btnHeart = document.querySelector('.btn-heart')
const idUser = userCurrent.id
// const favouriteMoviesByIdMovie = getData(`${favouriteMovieAPI}${idMovie}/`)
// const countHeart = favouriteMoviesByIdMovie.length
const textHeart = document.querySelector('.text-favourite')
const favouriteMovieByIdMovieAndIdUser = getData(`${favouriteMovieAPI}${idMovie}/${idUser}/`)
// textHeart.innerHTML = countHeart


function renderMovieInfor(movie){
    return `
        <img src=${movie.img}>
        <div class="movie__info-detail">
            <h1 class="movie__info-name">${movie.name}</h1>
            <p>${movie.decription}</p>
            <div class="movie__genre">
                <span class="movie__genre-label">Genre :</span>
                <span class="movie__genre-detail">${movie.genre}</span>
            </div>
            <div class="movie__release">
                <span class="movie__release-label">Release Date :</span>
                <span class="movie__release-detail">${movie.release}</span>
            </div>
            <div class="movie__runtime">
                <span class="movie__runtime-label">Runtime :</span>
                <span class="movie__runtime-detail">${movie.run_time}</span>
            </div>
        </div>
    `
}

function renderReviewMovie(review, user){
    return `
        <li class="movie__review-item items-center">
            <img src=${user.img} class="w-[100px] h-[100px]"/>
            <div class="user__info">
                <h1 class="user__name">${user.username}</h1>
                <div class="user__rating">
                    ${renderRating(review)}
                </div>
            </div>
            <p class="review__text">
                ${review.content}
            </p>
        </li>
    `
}

function renderRating(review){
    let htmls = ""
    for(let i = 0; i < review.rating; i++){
        htmls += `<i class="fa-solid fa-star"></i>`
    }
    return htmls
}

function showReviewsMovie(reviews){
    let htmls = ""
    reviews.forEach(review => {
        const user = getData(`${reviewApi}${review.user_id}`)
        htmls += renderReviewMovie(review, user)
    })
    return htmls
}

previewMovie.src = movie.link_video
movieInfo.innerHTML = renderMovieInfor(movie)
reviewContainer.innerHTML = showReviewsMovie(reviewsByIdMovie)


// add review 
const textReview = document.querySelector('.moview__review-text')
const btnAddRview = document.querySelector('.btn-add-review')
const ratings = document.querySelectorAll('.icon-rating')
let countRating = 0;
btnAddRview.addEventListener('click', () => {
    const now = new Date();
    if(textReview.value != "") {
        const data = {
            "idUser": 1,
            "idMovie": Number(idMovie),
            "content": textReview.value,
            "rating": countRating,
            "time": now
        }
        addItem(data, reviewApi)
    }
    

})

ratings.forEach((rating, index) => {
    rating.addEventListener('click', () => {
        const checkRatings = document.querySelectorAll('.fa-solid.fa-star')
        if(checkRatings){
            checkRatings.forEach(rating => {
                rating.classList.remove('fa-solid')
                rating.classList.remove('text[#F5B50A]')
                rating.classList.add('fa-regular')
            })
        }
        for(let i = 0; i <= index; i++){
            ratings[i].classList.remove('fa-regular')
            ratings[i].classList.add('fa-solid')
            ratings[i].classList.add('text[#F5B50A]')
        }
        countRating = index + 1
    })
})

// add favourite movie
const handleAddFavouriteMovie = () => {
    const data = {
        "id_movie": Number(idMovie),
        "id_user": idUser
    }
    addItem(data,favouriteMovieAPI)
}

const handleDelFavouriteMovie = (id) => {
    delItem(id, favouriteMovieAPI)
}

let toggleHeart = false
if (favouriteMovieByIdMovieAndIdUser) {
    btnHeart.classList.remove('fa-regular')
    btnHeart.classList.add('fa-solid')
    toggleHeart = true
}

btnHeart.addEventListener('click', () => {
    if(toggleHeart == false){
        btnHeart.classList.remove('fa-regular')
        btnHeart.classList.add('fa-solid')
        handleAddFavouriteMovie()
    } else {
        btnHeart.classList.add('fa-regular')
        btnHeart.classList.remove('fa-solid')
        handleDelFavouriteMovie(favouriteMovieByIdMovieAndIdUser.id)
    }
    toggleHeart = !toggleHeart
})
