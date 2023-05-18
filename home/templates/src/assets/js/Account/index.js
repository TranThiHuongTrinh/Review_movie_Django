import { userApi } from "../API/api.js"


let list_Users = []

function main() {
    getData()
}
function getData() {
    fetch(userApi)
    .then(function (response) {
        return response.json()
    })
    .then(function (response) {
        list_Users = response
    })
}

export function submitSignInForm(e, email, password) {
    e.preventDefault()
    const account = list_Users.find(acc => acc.email == email && acc.password == password);
    if (account) {
        sessionStorage.setItem("currentUser", JSON.stringify(account));
        window.location.href = ("http://127.0.0.1:5501/home/templates/src/pages/Unsign/homepage.html");
    } else {
        alert("Tên đăng nhập hoặc mật khẩu không đúng!");
        window.location.href = "http://127.0.0.1:5501/home/templates/src/pages/Unsign/homepage.html";
    }
}
export function signOut() {
    sessionStorage.removeItem("currentUser")
    window.location.replace("http://127.0.0.1:5501/home/templates/src/pages/Unsign/homepage.html")
}
export function getInfor() {
    const currentUser = JSON.parse(sessionStorage.getItem("currentUser"));
    return currentUser
}
export function handleEdit(acc) {
    fetch(`${userApi}update/${acc.id}/`, {
        method: 'PUT',
        body:
            JSON.stringify(acc),
        headers: {
            'Content-Type': 'application/json'
        },
    }).then((response) => {
        sessionStorage.setItem("currentUser", JSON.stringify(acc));
        list_Users = list_Users.map(acc => acc.id == response.id ? response : acc)
        alert("Update successfully");
    })
}
export function submitSignUpForm(e, acc) {
    e.preventDefault();
    fetch(`${userApi}add/`, {
        method: 'POST',
        body:
            JSON.stringify(acc),
        headers: {
            'Content-Type': 'application/json'
        },
    }).then((response) => {
        return response.json();
    }).then(function (response) {
        list_Users.push(response)
        sessionStorage.setItem("currentUser", JSON.stringify(acc));
        window.location.reload()
    })
}
  
main()