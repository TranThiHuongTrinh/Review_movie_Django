import { movieApi } from "../API/api.js"
import { getMovie } from "./getMovie.js"
import renderRating from "../Rating/showRating.js"

const movieItems = document.querySelector('.movie-list')
const btnViewMovie = document.querySelector('.btn-viewmovie')
let userCurrent = JSON.parse(sessionStorage.getItem('currentUser'))
let list_Movie = await getMovie(movieApi)

function showMovies(list_Movie) {
    for(let i = 0; i < 8; i++) {
        const htmls = `<div class="w-[250px] h-[340px] relative group/film">
        <img src="${list_Movie[i].image}" alt="" class="w-full h-full">
        <div class="absolute bottom-0 left-[25%] flex flex-col items-center">
            <!-- film's name -->
            <div class="text-xl">${list_Movie[i].name}</div>
            <!-- film's rating -->
            <div class="flex gap-5 items-center my-4 bg-white px-2 pb-1 rounded-md">
                <img src="../../assets/img/tomato.png" alt="" class="w-[40px] h-[40px]">
                <div class="text-red-800 font-bold text-lg"> <span class="rating-text" id=${list_Movie[i].id}></span><span class="text-base">/ 5</span> </div>
            </div>
        </div>
        <!-- overlay -->
        <div class="w-full h-full absolute top-0 left-0 bg-[#cccccc99] opacity-0 duration-300 group-hover/film:opacity-100">
            <div class="w-[120px] h-[50px] rounded-xl bg-[#ED1B34] flex items-center justify-center absolute top-[50%] left-[25%] cursor-pointer opacity-80 hover:opacity-100 btn-read" data-id="${list_Movie[i].id}">READ MORE</div>
        </div>
    </div>`
        movieItems.innerHTML += htmls
    }
}

const handleReadMore = (e) => {
    const id = e.target.getAttribute('data-id');
    if(userCurrent) window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Movie/DetailMovie.html?id=${id}`;
    else window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Unsign/formSignIn.html`;

}

btnViewMovie.addEventListener('click', (e) => {
    e.preventDefault()
    window.location.href = `http://127.0.0.1:5500/home/templates/src/pages/Movie/ViewAllMovie.html`;
})

showMovies(list_Movie)

const btnsRead = document.querySelectorAll('.btn-read')
btnsRead.forEach(btn => {
    btn.addEventListener('click', (e) => {
        handleReadMore(e)
    })
})
const ratingTexts = document.querySelectorAll('.rating-text')
ratingTexts.forEach(rating => {
    renderRating(rating.id, rating)
})