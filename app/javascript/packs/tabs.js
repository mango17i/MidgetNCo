const tabs = () => {
  console.log('hello from tabs')
  const tab1 = document.querySelector(".tab-1")
    console.log(tab1)
  const tab2 = document.querySelector(".tab-2")
  console.log(tab2)
  const tab3 = document.querySelector(".tab-3")
  console.log(tab3)
  const tabContent1 = document.querySelector(".container_card_offer");
  const tabContent2 = document.querySelector(".container_card_reserv");

  tab1.addEventListener('click', (event) => {
    tab2.classList.remove("active")
    tab3.classList.remove("active")
    tab1.classList.add("active")
    tabContent2.classList.remove("active")
    tabContent1.classList.add("active")
  })
  tab2.addEventListener('click', (event) => {
    tab1.classList.remove("active")
    tab3.classList.remove("active")
    tab2.classList.add("active")
    tabContent1.classList.remove("active")
    tabContent2.classList.add("active")
  })
}

export { tabs };



/* quand je clique sur l'onglet 1, j'enlève la classe active à tous les onglets,
 j'enlève la classe active à tous les tab_contents
 j'ajoute la classe active à l'onglet que je viens de cliquer(this)
j'ajoute la classe active au bon tab_content */
