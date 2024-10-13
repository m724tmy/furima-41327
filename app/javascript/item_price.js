const price = () => {
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const fee = Math.floor(inputValue * 0.1);

    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = fee;
    const profit = document.getElementById('profit');
    const profitAmount = Math.floor(inputValue - fee);
    profit.innerHTML = profitAmount;
  });
};

window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);
