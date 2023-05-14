
const movieURL = "http://localhost:3000/movies"
const movieItems = document.querySelector('.movie-list')
const btnViewMovie = document.querySelector('.btn-viewmovie')
let userCurrent = JSON.parse(sessionStorage.getItem('currentUser'))
let list_Movie = []

function main() {
    getData(showMovies)
}
function getData(callback) {
    fetch(movieURL)
    .then(function (response) {
        return response.json()
    })
    .then(function (response) {
        list_Movie = response
        console.log(response);
        return response
    })
    .then(callback)
}
function showMovies(list_Movie) {
    for(let i = 0; i < 8; i++) {
        const htmls = `<div class="w-[250px] h-[340px] relative group/film">
        <img src="${list_Movie[i].img}" alt="" class="w-full h-full">
        <div class="absolute bottom-0 left-[25%] flex flex-col items-center">
            <!-- film's name -->
            <div class="text-xl">${list_Movie[i].name}</div>
            <!-- film's rating -->
            <div class="flex gap-5 items-center my-4 bg-white px-2 pb-1 rounded-md">
                <img src="../../assets/img/tomato.png" alt="" class="w-[40px] h-[40px]">
                <div class="text-red-800 font-bold text-lg">7.4 <span class="text-base">/ 10</span> </div>
            </div>
        </div>
        <!-- overlay -->
        <div class="w-full h-full absolute top-0 left-0 bg-[#cccccc99] opacity-0 duration-300 group-hover/film:opacity-100">
            <div class="w-[120px] h-[50px] rounded-xl bg-[#ED1B34] flex items-center justify-center absolute top-[50%] left-[25%] cursor-pointer opacity-80 hover:opacity-100" data-id="${list_Movie[i].id}" onclick="handleReadMore(event)">READ MORE</div>
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
main()