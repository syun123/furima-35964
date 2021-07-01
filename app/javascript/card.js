const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  Payjp.setPublicKey("pk_test_cdf812e2490a604ef1a1f2d4"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_address[number]"),
      cvc: formData.get("purchase_address[code]"),
      exp_month: formData.get("purchase_address[month]"),
      exp_year: `20${formData.get("purchase_address[year]")}`,
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      console.log(status)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
  
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);