window.addEventListener("input", () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    
    const proFitDom = document.getElementById("profit");
    proFitDom.innerHTML = inputValue - addTaxDom.innerHTML
  })
});
