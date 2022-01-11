window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const price = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(price * 0.1 );
    const fee = document.getElementById("profit");
    fee.innerHTML = Math.floor(price - Math.floor(price * 0.1 ))
  })
})
