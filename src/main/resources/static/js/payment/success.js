      const urlParams = new URLSearchParams(window.location.search);
      const paymentKey = urlParams.get("paymentKey");
      const orderId = urlParams.get("orderId");
      const amount = urlParams.get("amount");
	  const productnum = document.getElementById("productnum").value;
      async function confirm() {
        const requestData = {
          paymentKey: paymentKey,
          orderId: orderId,
          amount: amount,
          product_num:productnum,
        };

        const response = await fetch("/payment/confirm", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestData),
        });

        const json = await response.json();

        if (!response.ok) {
          window.location.href = `/payment/fail?message=${json.message}&code=${json.code}`;
        }
      }
      confirm();

      const paymentKeyElement = document.getElementById("paymentKey");
      const orderIdElement = document.getElementById("orderId");
      const amountElement = document.getElementById("amount");
      alert("결제 성공 !!!");
      location.href = "/product/list";
      orderIdElement.textContent = "주문번호: " + orderId;
      amountElement.textContent = "결제 금액: " + amount;
      paymentKeyElement.textContent = "paymentKey: " + paymentKey;