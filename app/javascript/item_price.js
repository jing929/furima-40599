const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
        const tax = Math.floor(inputValue * 0.1);
        const profit = Math.floor(inputValue - tax);
        document.getElementById("add-tax-price").innerHTML = tax;
        document.getElementById("profit").innerHTML = profit;
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);