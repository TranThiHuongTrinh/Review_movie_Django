const prev_btn = document.getElementById('prev_link')
const next_btn = document.getElementById('next_link')

let perPage = 10
let currentPage = 1
let start = 0
let end = perPage
let totalPages = 0

export function renderListPage(totalPages, list, cb) {
    let htmls = ''
    htmls += `<div class="float-left py-2 px-4 duration-300 bg-gradient-to-b from-[#e6e6e61a] to-[#0000001a] border border-[#ff2a23] mx-1 cursor-pointer hover:text-white hover:border-[#111] hover:from-[#585858] hover:to-[#111]">${1}</div>`
    for (let i = 2; i <= totalPages; i++) {
        htmls += `<div class=" float-left py-2 px-4 duration-300 mx-1 cursor-pointer bg-gradient-to-b hover:text-white hover:border-[#111] hover:from-[#585858] hover:to-[#111]">${i}</div>`
    }
}
