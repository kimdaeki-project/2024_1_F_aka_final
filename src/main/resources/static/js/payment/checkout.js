	  const button = document.getElementById("payment-button");
      const coupon = document.getElementById("coupon-box");
      const generateRandomString = () =>
        window.btoa(Math.random()).slice(0, 20);
      var amount = document.getElementById("amount").value;
      const customerKey = document.getElementById("customerkey").value;
      const clientKey = document.getElementById("clientkey").value;
      const paymentWidget = PaymentWidget(clientKey, customerKey); // 회원 결제
      const memberid = document.getElementById("memberid").value;
      const productnum = document.getElementById("productnum").value;
      
      paymentMethodWidget = paymentWidget.renderPaymentMethods(
        "#payment-method",
        { value: amount },
        { variantKey: "DEFAULT" }
      );    
      
      paymentWidget.renderAgreement("#agreement", { variantKey: "AGREEMENT" });
      coupon.addEventListener("change", function () {
        if (coupon.checked) {
          paymentMethodWidget.updateAmount(amount - 5000);
        } else {
          paymentMethodWidget.updateAmount(amount);
        }
      });
      
      button.addEventListener("click", function () {
        paymentWidget.requestPayment({
          orderId: document.getElementById("odrdeid").value,
          orderName: document.getElementById("orderName").value,
          successUrl: window.location.origin + "/payment/success?product_num="+productnum+"&member_id="+memberid,
          failUrl: window.location.origin + "/payment/fail",
          customerEmail: document.getElementById("customerEmail").value,
          customerName: document.getElementById("customerName").value,
          customerMobilePhone: document.getElementById("customerMobilePhone").value,
        });
      });