let searchElm = document.getElementById('search')
searchElm.addEventListener('input', () => {
  console.log(searchElm.value)
  getMemos(searchElm.value)
})

function getMemos (searchWord = '') {
  fetch(`/api/memos?like=${searchWord}`)
    .then(response => {
      return response.json()
    })
    .then(json => {
      let username = json.username
      let memos = json.memos
      let memosElm = document.getElementById('memos')

      // 要素をすべて削除
      memosElm.textContent = null

      for (let i in memos) {
        displayMemo(memosElm, username, memos[i])
      }
    })
}

function displayMemo (target, username, memo) {
  let column = document.createElement('div')
  column.className = 'col s10 offset-s1'

  let card = document.createElement('div')
  card.className = 'card orange lighten-3'
  column.appendChild(card)

  let cardContent = document.createElement('div')
  cardContent.className = 'card-content black-text'
  card.appendChild(cardContent)

  let status = document.createElement('div')
  status.className = 'status-content'
  status.innerHTML = memo.memo_status
  cardContent.appendChild(status)

  let rowInCard = document.createElement('div')
  rowInCard.className = 'row actions'
  cardContent.appendChild(rowInCard)

  let goToToot = document.createElement('div')
  goToToot.className = 'col s6 center go-to-toot'
  goToToot.innerHTML = `<a href="https://mstdn-workers.com/@${username}/${memo.id}" class="card-link"><i class="material-icons memo-link-icon">subdirectory_arrow_right</i> </a>`
  rowInCard.appendChild(goToToot)

  target.appendChild(column)
}
