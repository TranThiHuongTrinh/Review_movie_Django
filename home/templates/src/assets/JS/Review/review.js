import {getReviewByIdUser, getReviewByIdReview} from './getReview.js'
import {getMovieByIdMovie} from '../Movie/getMovie.js'
import { delItem, updateItem } from '../handles/handles.js'
import userCurrent from "../Movie/index.js"
import renderRating from '../Rating/rating.js'
import { reviewApi, reviewMovieApi, reviewUserApi } from '../API/api.js'

let idUser = null
if(userCurrent) idUser = userCurrent.id

let idUp = 1
let countRating = 0
const reviewsShow = document.querySelector('.movie__review-list')
let reviewsByIdUser = await getReviewByIdUser(idUser)
const textReview = document.querySelector('.text-review')
const ratings = document.querySelectorAll('.icon-rating')
const modal = document.querySelector('.modal__edit')
const close_modal = document.querySelector('.icon-close')
const movieRateUp = document.querySelector('.movie__rate')


// show tất cả review của 1 user -> show tất cả review của tất cả film mà user đó review
function renderReviewUser(review, movie){
    return `
    <li class="movie__review-item"  style="gap: 50px;">
        <img src=${movie.image} style="width: 150px;" />
        <div class="user__info">
            <h1 class="user__name">${movie.name}</h1>
            <div class="user__rating">
                ${renderRating(review)}
            </div>
        </div>
        <p class="review__text">
           ${review.content}
        </p>
        <div class="review__change" style="cursor: unset;">
            <i class="fa-solid fa-pen-to-square btn-up" data-id="${review.id}" style="height: 25px; cursor: pointer"></i>
            <i class="fa-solid fa-trash btn-del" data-id="${review.id}"  style="height: 25px; cursor: pointer"></i>
        </div>
    </li>
    `
}


function showReviewsUser(reviews) {
    let htmls = ""
    reviews.forEach(review => {
        htmls += renderReviewUser(review, getMovieByIdMovie(review.movie))
    });
    return htmls
}


reviewsShow.innerHTML = showReviewsUser(reviewsByIdUser)
const btnsDel = document.querySelectorAll('.btn-del')
const btnsUp = document.querySelectorAll('.btn-up')

// event click

const handleDel = (id) => {
    delItem(id, `${reviewApi}delete/${id}/`,)
    reviewsByIdUser = reviewsByIdUser.filter(review => review.id !== id)
    reviewsShow.innerHTML = showReviewsUser(reviewsByIdUser)
}

const handleUp = (id) => {
    const review = reviewsByIdUser.find(item => item.id == id)
    const now = new Date();
    if(countRating == 0) countRating = review.rating
    const data = {
        "id": Number(id),
        "content": textReview.value,
        "rating": countRating,
        "time": now,
        "user": idUser,
        "movie": review.movie
    }
    updateItem(id, data, `${reviewApi}update/${id}/`)
    reviewsByIdUser = reviewsByIdUser.map(review => review.id == id ? review = data : review)
    console.log(reviewsByIdUser);
    reviewsShow.innerHTML = showReviewsUser(reviewsByIdUser)
    window.location.reload()
}

const uploadData = (id) => {
    idUp = id
    const review = reviewsByIdUser.find(item => item.id == id)
    textReview.value = review.content
    for(let i = 0;i < review.rating; i++){
        ratings[i].classList.remove('fa-regular')
        ratings[i].classList.add('fa-solid')
        ratings[i].classList.add('text-rating')
    }
    // movieRateUp.innerHTML = renderRating(review)
}

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


btnsDel.forEach(btnDel => {
    btnDel.addEventListener('click', (e) => {
        const id = e.target.dataset.id;
        handleDel(id)
    })
})

// const btnUpdateRview = document.querySelector('.btn-update-review')

btnsUp.forEach(btnUp => {
    btnUp.addEventListener('click', (e) => {
        const id = e.target.dataset.id;
        modal.style.display = 'block'
        document.body.style.overflow = 'hidden'
        uploadData(id)
    })
})
close_modal.addEventListener('click', () => {
    modal.style.display = 'none'
    document.body.style.overflow = 'unset'
})
btnUpdateRview.addEventListener('click', (e) => {
    handleUp(idUp)
})




