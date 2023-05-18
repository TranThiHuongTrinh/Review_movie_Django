import {getReviewsByIdMovie} from '../Review/getReview.js'

async function renderRating(id, rating) {
    const reviews = await getReviewsByIdMovie(id)
    let ratingAvg = 0
    reviews.forEach(review => {
        ratingAvg += Number(review.rating)
    });
    ratingAvg = ratingAvg / reviews.length
    rating.innerHTML = reviews.length > 0 ? ratingAvg : 0
}

export default renderRating


