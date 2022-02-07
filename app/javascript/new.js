function calc(){
  const price = document.getElementById("item-price");
  price.addEventListener('input', () => {

    const priceVal = price.value;
    const tax = 0.1;
    const tax_fee = Math.floor(priceVal * tax);
    const profit = priceVal - tax_fee;
    const taxForm = document.getElementById("add-tax-price");
    const profitForm = document.getElementById("profit");
    taxForm.innerHTML = tax_fee.toLocaleString();
    profitForm.innerHTML = profit.toLocaleString();
  });
};

window.addEventListener('load', calc);