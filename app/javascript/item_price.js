window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
   console.log(inputValue);
   let tax = Math.floor(inputValue * 0.1);
 
    const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = tax

   let gain = Math.floor(inputValue - tax);

   const addGainDom = document.getElementById("profit");
   addGainDom.innerHTML = gain
})
});

