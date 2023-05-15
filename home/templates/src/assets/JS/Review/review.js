import {getListReviewByIdUser, getReviewByIdRview} from './getReview.js'
import {getMovieByIdMovie} from '../Movie/getMovie.js'
import { delItem, updateItem } from '../handles/handles.js'

const reviewAPI = " http://localhost:3000/reviews"
const idUser = 1
let idUp = 1
let countRating = 0
const reviewsShow = document.querySelector('.movie__review-list')
let reviewsByIdUser = getListReviewByIdUser(idUser)
const textReview = document.querySelector('.text-review')
const ratings = document.querySelectorAll('.icon-rating')
const modal = document.querySelector('.modal__edit')
const close_modal = document.querySelector('.icon-close')

// show tất cả review của 1 user -> show tất cả review của tất cả film mà user đó review
function renderReviewUser(review, movie){
    return `
    <li class="movie__review-item"  style="gap: 50px;">
        <img src=${movie.img} style="width: 150px;" />
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
        htmls += renderReviewUser(review, getMovieByIdMovie(review.idMovie))
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
    console.log(id, reviewsByIdUser);
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

const btnUpdateRview = document.querySelector('.btn-update-review')

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
modal.addEventListener('click', () => {
    modal.style.display = 'none'
    document.body.style.overflow = 'unset'
})
btnUpdateRview.addEventListener('click', (e) => {
    handleUp(idUp)
})




