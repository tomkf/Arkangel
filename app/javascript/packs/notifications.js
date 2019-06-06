import Toastify from 'toastify-js'



const authToken = document.querySelector('meta[name="csrf-token"]').content;

const url = '/notification'

const initNotify = () =>  { setInterval (() => {
  fetch(url, {
      method: "GET",
      headers: {
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': authToken
      },
      credentials: 'same-origin'
    })
    .then((response) => response.json())
    .then((data) => {
       console.log(data.score);
       if (data.score !== null) {
       Toastify({
          text: data.score,
          duration: 13000,
          destination: "/dashboard",
          newWindow: false,
          close: true,
          gravity: "top", // `top` or `bottom`
          positionLeft: false, // `true` or `false`
          backgroundColor: "linear-gradient(to right, #00b09b, #96c93d)",
          stopOnFocus: true // Prevents dismissing of toast on hover
        }).showToast();
      }
    })
  },5000)
};

export { initNotify };

