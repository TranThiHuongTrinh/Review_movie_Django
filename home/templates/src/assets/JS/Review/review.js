import { delItem, updateItem, getData } from '../handles/handles.js'
import {movieApi, reviewMovieApi, reviewApi} from '../API/api.js'
import userCurrent from "../Movie/index.js"
const idUser = userCurrent.id
console.log(idUser);
let idUp = 1
let countRating = 0
const reviewsShow = document.querySelector('.movie__review-list')
let reviewsByIdUser = await getData(`${reviewMovieApi}${idUser}/`)


// show tất cả review của 1 user -> show tất cả review của tất cả film mà user đó review
function renderReviewUser(review, movie){
    return `
    <li class="movie__review-item">
        <img src=${movie.img} />
        <div class="user__info">
            <h1 class="user__name">${movie.name}</h1>
            <div class="user__rating">
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
            </div>
        </div>
        <p class="review__text">
           ${review.content}
        </p>
        <div class="review__change">
            <i class="fa-solid fa-pen-to-square btn-up" data-id="${review.id}"></i>
            <i class="fa-solid fa-trash btn-del" data-id="${review.id}"></i>
        </div>
    </li>
    `
}


function showReviewsUser(reviews) {
    let htmls = ""
    reviews.forEach(review => {
        const movie = getData(`${movieApi}${review.movie_id}`)
        htmls += renderReviewUser(review, movie)
    });
    return htmls
}


reviewsShow.innerHTML = showReviewsUser(reviewsByIdUser)
const btnsDel = document.querySelectorAll('.btn-del')
const btnsUp = document.querySelectorAll('.btn-up')

// event click
const deleteReview = async (id) => {
    try {
      const response = await fetch(`${reviewAPI}/${id}`, {
        method: 'DELETE'
      });
    } catch (error) {
      console.error(error);
    }
}

const handleDel = (id) => {
    deleteReview(id)
    reviewsByIdUser = reviewsByIdUser.filter(review => review.id !== id)
    reviewsShow.innerHTML = showReviewsUser(reviewsByIdUser)
}

const handleUp = (id) => {
    const review = reviewsByIdUser.find(item => item.id == id)
    const now = new Date();
    if(countRating == 0) countRating = review.rating
    const data = {
        "idUser": idUser,
        "idMovie": idUp,
        "content": textReview.value,
        "rating": countRating,
        "time": now
    }
    updateItem(id, data, reviewAPI)
    reviewsByIdUser = reviewsByIdUser.filter(review => review.id == id ? review = data : review)
    reviewsShow.innerHTML = showReviewsUser(reviewsByIdUser)
}

const textReview = document.querySelector('.text-review')
const ratings = document.querySelectorAll('.icon-rating')
const uploadData = (id) => {
    idUp = id
    const review = reviewsByIdUser.find(item => item.id == id)
    textReview.value = review.content
    for(let i = 0;i <= review.rating; i++){
        ratings[i].classList.remove('fa-regular')
        ratings[i].classList.add('fa-solid')
        ratings[i].classList.add('text[#F5B50A]')
    }
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
        uploadData(id)
    })
})

// btnUpdateRview.addEventListener('click', (e) => {
//     handleUp(idUp)
// })




