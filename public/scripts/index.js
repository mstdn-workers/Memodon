window.onload = () => {
  let titleArea= document.querySelector('#title')
  window.setTimeout(() => {
    titleArea.classList.add('z-depth-3')
    titleArea.classList.add('card')
  }, 1800)
}
