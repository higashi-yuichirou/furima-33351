function price() {
  const tax = 10
  const price = document.getElementById("item-price")
  const addTax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  price.addEventListener('input', () => {
    const value = price.value;
    addTax.innerHTML = Math.floor(value / tax);
    profit.innerHTML = Math.floor(value - addTax.innerHTML);
  })
  
  

}

window.addEventListener('load', price)