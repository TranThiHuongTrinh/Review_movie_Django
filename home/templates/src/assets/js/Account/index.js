let list_Users = []
const email = document.querySelector('#email')
const password = document.querySelector('#password')

const userURL = "http://localhost:3000/users"

function main() {
    getData()
}
function getData() {
    fetch(userURL)
    .then(function (response) {
        return response.json()
    })
    .then(function (response) {
        list_Users = response
        // console.log(response);
    })
}

export function submitSignInForm() {
    const account = list_Users.find(acc => acc.email == email.value && acc.password == password.value);
    console.log(account);
    if (account) {
        localStorage.setItem("currentUser", JSON.stringify(account));
        if(account.isAdmin == true) {
            // window.location.href = ("http://127.0.0.1:5500/home/templates/src/pages/Movie/ViewAllMovie.html");
            // console.log("admin");
        }
        else {
            window.location.href = ("http://127.0.0.1:5500/home/templates/src/pages/Movie/ViewAllMovie.html");
            // console.log("client");
        }
    } else {
        alert("Tên đăng nhập hoặc mật khẩu không đúng!");
        window.location.href = "http://127.0.0.1:5500/home/templates/src/pages/Unsign/homepage.html";
    }
}
export function signOut() {
    localStorage.removeItem("currentUser")
    window.location.replace("http://127.0.0.1:5500/home/templates/src/pages/Unsign/homepage.html")
}
export function getInfor() {
    const currentUser = JSON.parse(localStorage.getItem("currentUser"));
    // console.log(currentUser);
    return currentUser
}
main()