const inputs = document.querySelectorAll('.input-form')
const setValueInputEmpty = () => {
    inputs[0].value = ""
    inputs[1].style.display = "inline-block"
    inputs[1].value = ""
    inputs[2].value = ""
    inputs[3].value = ""
    inputs[4].value = ""
    inputs[5].value = ""
}

export default setValueInputEmpty