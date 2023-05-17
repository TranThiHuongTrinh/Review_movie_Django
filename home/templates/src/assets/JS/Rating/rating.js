export default function renderRating(review){
    let htmls = ""
    for(let i = 0; i < review.rating; i++){
        htmls += `<i class="fa-solid fa-star"></i>`
    }
    return htmls
}

