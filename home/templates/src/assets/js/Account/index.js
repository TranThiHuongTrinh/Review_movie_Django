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
    if (account) {
        sessionStorage.setItem("currentUser", JSON.stringify(account));
        window.location.href = ("http://127.0.0.1:5500/home/templates/src/pages/Unsign/homepage.html");
    } else {
        alert("Tên đăng nhập hoặc mật khẩu không đúng!");
        window.location.href = "http://127.0.0.1:5500/home/templates/src/pages/Unsign/homepage.html";
    }
}
export function signOut() {
    sessionStorage.removeItem("currentUser")
    window.location.replace("http://127.0.0.1:5500/home/templates/src/pages/Unsign/homepage.html")
}
export function getInfor() {
    const currentUser = JSON.parse(sessionStorage.getItem("currentUser"));
    // console.log(currentUser);
    return currentUser
}
export function handleEdit(acc) {
    fetch(userURL + '/' + acc.id, {
        method: 'PUT',
        body:
            JSON.stringify(acc),
        headers: {
            'Content-Type': 'application/json'
        },
    }).then((response) => {
        console.log(response.json());
        sessionStorage.setItem("currentUser", JSON.stringify(acc));
        return response.json();
    }).then(function (response) {
        list_Users = list_Users.map(acc => acc.id == response.id ? response : acc)
        // console.log(list_Users);
        showData(list_Users);
    })
}
export function submitSignUpForm(acc) {
    acc.id = list_Users.length + 1
    fetch(userURL, {
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
    })
}
  
main()