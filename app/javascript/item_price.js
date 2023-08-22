window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(inputValue * 0.1)
    
    const proFitDom = document.getElementById("profit");
    proFitDom.innerHTML = inputValue - addTaxDom.innerHTML
  })
});