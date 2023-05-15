export const isEmpty = (value) => {
    if(value) return false
    else return true
}
export const isValidEmail = (email) => {
    let regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
    if(!regex.test(email)){
        return false
    }
    return true
}
export const minLength = (str, minlength) => {
    if(str.length < minlength) return false
    return true 
}
