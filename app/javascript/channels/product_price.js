window.addEventListener('load', () => {
const priceInput = document.getElementById("product-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom);

    const addTaxDom = document.getElementById("profit");
    profitNumber.innerHTML = (Math.floor(inputValue - addTaxDom));
    console.log(profitNumber);
  })
});