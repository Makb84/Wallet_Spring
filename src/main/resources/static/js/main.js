document.addEventListener("DOMContentLoaded", function () {
    // Get Transaction Type:
    const transactType = document.querySelector("#transact-type");
    
    // Get Transaction Forms:
    const depositCard = document.querySelector(".deposit");
    const withdrawCard = document.querySelector(".withdraw");
    const transferCard = document.querySelector(".transfer");

    // Hide all transaction cards initially
    function hideAllCards() {
        depositCard.style.display = "none";
        withdrawCard.style.display = "none";
        transferCard.style.display = "none";
    }

    // Initially hide all cards when the page loads
    hideAllCards();

    // Add event listener to detect the change in transaction type
    transactType.addEventListener("change", () => {
        // Hide all cards first
        hideAllCards();

        // Show the relevant card based on the selected type
        switch (transactType.value) {
            case "deposit":
                depositCard.style.display = "block";
                break;

            case "withdraw":
                withdrawCard.style.display = "block";
                break;

            case "transfer":
                transferCard.style.display = "block";
                break;

            default:
                // Hide all cards if no selection
                hideAllCards();
                break;
        }
    });
});









// // Get Transaction Type:
// const transactType = document.querySelector("#transact-type");

// // Get Transaction Forms:
// // const paymentCard = document.querySelector(".payment-card");
// const depositCard = document.querySelector(".deposit-card");
// const withdrawCard = document.querySelector(".withdrawal-card");
// const transferCard = document.querySelector(".transfer-card");

// // Check For Transaction Type Evenet Listener:
// transactType.addEventListener("change",() =>{

//     // Check For Transaction Type and Display Form:
//     switch(transactType.value){
//         // case "payment":
//         //     paymentCard.style.display = "block";
//         //     paymentCard.nextElementSibling.style.display = "none";
//         //     depositCard.style.display = "none";
//         //     withdrawCard.style.display = "none";
//         // break;

//         case "transfer":
//             transferCard.previousElementSibling.style.display = "none";
//             transferCard.style.display = "block";
//             transferCard.nextElementSibling.style.display = "none";
//             withdrawCard.style.display = "none";
//         break;

//         case "deposit":
//             paymentCard.style.display = "none";
//             depositCard.previousElementSibling.style.display = "none";
//             depositCard.style.display = "block";
//             depositCard.nextElementSibling.style.display = "none";
//         break;

//         case "withdraw":
//             withdrawCard.previousElementSibling.style.display = "none";
//             withdrawCard.style.display = "block";
//             transferCard.style.display = "none";
//             paymentCard.style.display = "none";
//         break;        
        
//     }
//     // End Of Check For Transaction Type and Display Form.

// });
// // End Of Check For Transaction Type Evenet Listener.