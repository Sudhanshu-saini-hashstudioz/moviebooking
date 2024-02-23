<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Movie </title>

        <link rel="icon"
            href="data:image/png;base64,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" />

        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: 'Lato', sans-serif;
            }

            .navbar {
                background-color: oldlace;
            }


            .btn {

                max-width: min-content;
                align-self: center;
                border-radius: 15px;
                background: linear-gradient(145deg, #ffffff, #e3dede);
                box-shadow: 7px 7px 8px #656363,
                    -7px -7px 8px #ffffff;

                color: maroon;
                background-color: lavender;
                border-radius: 10px;
                cursor: pointer;
            }

            /* .overlay>body {
                filter: blur(10px);
                transform: scale(0.9, 0.9);
            } */

            .overlay {
                position: fixed;
                top: 0;
                right: -50%;
                width: 0%;
                height: 100%;
                background-color: oldlace;
                overflow-x: hidden;
                transition: 0.2s;
                z-index: 10;

            }

            .overlay-content {
                position: relative;
                top: 10%;
                width: 100%;
                text-align: center;
                margin-top: 30px;
            }

            .overlay.left {
                left: 0;
            }

            .closebtn {
                position: absolute;
                top: 10px;
                left: 80%;
                font-size: 30px;
                cursor: pointer;
            }

            .overlay a {
                padding: 8px;
                text-decoration: none;
                font-size: 20px;
                color: maroon;
                display: block;
                transition: 0.1s;
                border-color: grey;
                border-block: inherit;
            }

            .overlay a:hover,
            .hamburger:hover,
            .overlay a:focus {
                color: darksalmon;
                background-color: lavender;
                border-radius: 10px;
                transition: transform 0.3s ease-out;
                transform: scale(1.15);
            }

            @media screen and (max-height: 450px) {
                .overlay a {
                    font-size: 20px
                }

                .overlay .closebtn {
                    font-size: 40px;
                    top: 15px;
                    right: 35px;
                }
            }

            #loginbutton,
            #logout {}

            .logobtn {
                top: 15px;
                left: 10px;
            }

            .btn:hover {
                color: darksalmon;
            }

            .form-control:hover {
                border-color: 3px solid rgb(235, 84, 84);
                border: 0.5px solid rgb(235, 84, 84);
                box-shadow: 0 0 15px rgb(172, 134, 134);
            }

            .card-body {
                border-radius: 15px;
                background-color: whitesmoke;
                box-shadow: 5% rgb(235, 84, 84);
                padding: 20px;
                text-align: center;
                /* align-self: center; */
            }

            #showContainer {
                display: flex;
                /* flex-wrap: wrap; */
                justify-content: left;
                flex-direction: row;

            }

            .show-card {
                background-color: rgb(253, 245, 230);
                border-radius: 15px;
                width: 65%;
                height: fit-content;
                margin: 10px;
                padding-top: 20px;
                padding-bottom: 20px;
                padding-left: 40px;
                border: 1px solid oldlace;
                box-shadow: 0 0 5px rgba(253, 245, 230, 0.3);
                text-align: center;
                display: inline-flex;
                justify-content: left;
                flex-direction: row;
            }

            .payment-card {
                background-color: oldlace;
                border-radius: 15px;
                width: 32%;
                margin: 10px;
                padding-top: 30px;
                padding-bottom: 20px;
                padding-right: 10px;
                padding-left: 10px;
                border: 1px solid #ccc;
                box-shadow: 0 0 5px rgba(253, 245, 230, 0.3);
                /* text-align: center; */
                display: flex;
                justify-content: space-between;
                flex-direction: column;
            }

            .payment-card div {
                padding-right: 5px;
                display: flex;
                justify-content: space-between;

            }

            .forfee,
            .forseat,
            .foramount {
                flex-direction: row;
                width: 100%;
                margin: 5px;
                align-content: center;
            }

            .ratingcontainer {
                flex-direction: row;
                display: inline-flex;
                justify-content: center;
                text-align: center;
            }

            .details {
                display: flex;
                flex-direction: column;
                position: relative;
                align-items: flex-start;
                padding-left: 25px;
            }

            .ticketbtn {
                border-radius: 10px;
                background-color: grey;
                align-items: baseline;
            }

            .forfee:nth-child(2) {
                text-align: right;
                font-size: xx-large;
            }

            .show-card img,
            showcard img {
                border-radius: 10px;
                margin-top: 2px;
                width: fit-content;
                justify-content: baseline;
                height: 250px;
                object-fit: cover;
            }

            #container {
                display: flex;
                /* flex-wrap: wrap; */
                margin-left: 40px;
                margin-top: 10px;
                justify-content: left;
            }

            .summary {
                color: brown;
                justify-content: left;
            }

            .foramount {
                padding-top: 5px;
                padding-bottom: 5px;
                background-color: rgb(250, 188, 198);
            }

            .foramount,
            .cofirmticket {
                bottom: 0px;
            }

            .forseat,
            .forfee,
            .foramount {
                justify-content: space-around;
            }

            .showcards {
                background-color: whitesmoke;
                border-radius: 15px;
                width: calc(20% - 15px);
                margin: 10px;
                border: 1px solid #ccc;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
                text-align: center;
            }
        </style>

        </style>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

        <script>



            $(document).ready(function () {

                var showId = localStorage.getItem("showId");
                $.ajax({
                    url: "http://localhost:1212/api/v1/auth/getshowbyid",
                    type: "GET",
                    contentType: 'application/json; charset=utf-8',
                    data: {
                        id: showId
                    },
                    async: false,
                    success: function (response) {

                        var show = JSON.parse(JSON.stringify(response));
                        populateCard(show);
                    },
                    error: function (e) {
                        alert("Something Went Wrong:");
                        window.location.replace("http://localhost:1212/movie/home");
                    }
                });

            });




            function populateCard(show) {
                var showContainer = document.getElementById("showContainer");
                showContainer.innerHTML = "";
                var card = createShowCard(show);
                showContainer.appendChild(card);
                var paymentCard = createPaymentCard(show);
                showContainer.appendChild(paymentCard);

            }



            function createShowCard(show) {
                var card = document.createElement("div");
                var card1 = document.createElement("div");
                var card2 = document.createElement("div");
                var ratingContainer = document.createElement("div");
                card.className = "show-card";
                card1.className = "image";
                card2.className = "details";
                ratingContainer.className = "ratingcontainer";

                var imageElement = document.createElement("img");

                // Use the first photo if available
                if (show.files && show.files.length > 0) {
                    var base64Image = show.files[0].imagedata;
                    imageElement.src = "data:image/jpeg;base64," + base64Image;
                } else {
                    imageElement.src = "path/to/default/image.jpg";
                }

                imageElement.alt = "Show Image";

                var titleElement = document.createElement("h2");
                titleElement.innerText = show.upcomingShows;

                var ratingElement = document.createElement("h4");
                ratingElement.innerText = "  " + show.rating + "/10";

                var ratingIcon = document.createElement("i");
                ratingIcon.className = "fa fa-star";
                ratingIcon.setAttribute("aria-hidden", "true");

                ratingContainer.appendChild(ratingIcon);
                ratingContainer.appendChild(document.createTextNode(" "));
                ratingContainer.appendChild(ratingElement);

                var languageElement = document.createElement("h5");
                languageElement.innerText = show.language;

                var genreElement = document.createElement("h5");
                genreElement.innerText = show.genre;

                var theatreElement = document.createElement("h6");
                theatreElement.innerText = "Screen " + show.screenId + " , " + show.theatre.theatreName + " ,  " + show.theatre.city;

                var timeElement = document.createElement("h6");
                timeElement.innerText = show.runningTime;

                card1.appendChild(imageElement);
                card2.appendChild(titleElement);
                card2.appendChild(ratingContainer);
                card2.appendChild(languageElement);
                card2.appendChild(genreElement);
                card2.appendChild(timeElement);
                card2.appendChild(theatreElement);


                card.appendChild(card1);
                card.appendChild(card2);
                return card;
            }



            // Update createPaymentCard function to include seat numbers, fees, and total payment

            var finalPrice;
            function createPaymentCard(show) {
                var paymentCard = document.createElement("div");
                paymentCard.className = "payment-card";

                var title = document.createElement("div");
                title.className = "summary";
                title.innerText = "BOOKING SUMMARY";

                // Seat numbers
                var forseat = document.createElement("div");

                forseat.className = "forseat";
                var seatNumbers = document.createElement("span");
                seatNumbers.innerText = "Seat No ." + sessionStorage.getItem("bookingSeats");
                forseat.appendChild(seatNumbers);
                var basePrice = document.createElement("span");
                basePrice.innerText = " Rs . " + sessionStorage.getItem("amount");
                forseat.appendChild(basePrice);


                // Fees
                var forfee = document.createElement("div");
                forfee.className = "forfee";
                var fees = document.createElement("span");
                fees.innerText = "Convenience&fees";
                forfee.appendChild(fees);

                var tax = sessionStorage.getItem("amount") * 14 / 100;
                var fee = (tax + tax * 18 / 100);;
                var feesamount = document.createElement("span");
                feesamount.innerText = " Rs . " + fee;
                forfee.appendChild(feesamount);

                // Total payment
                var foramount = document.createElement("div");
                foramount.className = "foramount";
                var totalPayment = document.createElement("span");
                totalPayment.innerText = "Total Payment ";
                foramount.appendChild(totalPayment);
                var totalAmount = document.createElement("span");
                finalprice = parseFloat(sessionStorage.getItem("amount")) + parseFloat(fee);
                sessionStorage.setItem("finalprice", finalprice);
                totalAmount.innerText = " Rs . " + (finalprice);
                foramount.appendChild(totalAmount);


                var confirmBooking = document.createElement("button");
                confirmBooking.innerText = "Pay Amount " + " Rs . " + (finalprice);
                confirmBooking.className = "btn confirmticket";
                confirmBooking.setAttribute("onclick", "getinvoice()");


                paymentCard.appendChild(title)

                paymentCard.appendChild(forseat)

                paymentCard.appendChild(forfee);

                paymentCard.appendChild(document.createElement("hr"));

                paymentCard.appendChild(foramount);

                paymentCard.appendChild(confirmBooking);

                return paymentCard;
            }




            //============================================= invoicing =================================================


            function getinvoice() {

                var showId = localStorage.getItem("showId");

                token = localStorage.getItem("token");

                const selectedSeats = arrayToList(sessionStorage.getItem("bookedSeat"));
                const isSelectedSeats = arrayToList(sessionStorage.getItem("isSelectedSeats"));

                var seatNumberString = sessionStorage.getItem("bookingSeats");
                var seatNumberArray = seatNumberString.split(',');
                var seatNumber = seatNumberArray.map(String);

                var data = {
                    show: {
                        showId: showId
                    },
                    totalTickets: selectedSeats.length,
                    bookingSeat: selectedSeats,
                    amount: sessionStorage.getItem("finalprice"),
                    seatNumber: seatNumber,
                    pendingSeats: isSelectedSeats
                }

                var headers = {
                    "Authorization": "Bearer " + token,
                };
                $.ajax({
                    url: "http://localhost:1212/api/v1/user/getOrderDetails",
                    type: "POST",
                    headers: headers,
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    async: false,


                    success: function (response) {

                        var orderdetails = JSON.parse(JSON.stringify(response));
                        var orderId = orderdetails.id;

                        var invoiceId = getInvoice(data, orderId);

                        let option = {
                            key: "rzp_test_2ZbY5hDyVZAQVh",
                            amount: orderdetails.amount,
                            currency: "INR",
                            order_id: orderId,
                            name: sessionStorage.getItem("showName"),
                            description: seatNumber + "",
                            image: "http://localhost:1212/movie/logo1.png",

                            handler: function (response) {
                                confirmPayment();

                            },

                            prefill: {
                                name: "",
                                email: response.email,
                                contact: ""
                            },
                            notes: {
                                address: "Razorpay Corporate Office"
                            },
                            theme: {
                                color: "#3399cc"
                            }
                        };

                        let rzp = new Razorpay(option);
                        rzp.on('payment.failed', function (response) {

                            console.log(response);
                            var headers = {
                                "Authorization": "Bearer " + localStorage.getItem("token")
                            }

                            $.ajax({
                                url: "http://localhost:1212/api/v1/user/paymentfailed?id=" + sessionStorage.getItem("invoiceId"),
                                type: "PUT",
                                headers: headers,
                                contentType: 'application/json; charset=utf-8',
                                async: false,
                                success: function (response) {
                                    window.location.href = "movie";
                                },
                                error: function (e) {
                                    window.location.reload();
                                }

                            })
                           
                        });

                        rzp.open();

                    },
                    error: function (e) {
                        console.log(e);
                        window.location.href = "seat";
                    }
                });

            }

            function getInvoice(data, orderId) {
                token = localStorage.getItem("token");
                var headers = {
                    "Authorization": "Bearer " + token,
                };
                $.ajax({
                    url: "http://localhost:1212/api/v1/user/getInvoice?orderId=" + orderId,
                    type: "POST",
                    headers: headers,
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    async: false,
                    success: function (response) {
                        sessionStorage.setItem("invoiceId", response);
                    },
                    error: function (e) {
                        window.location.reload();
                    }
                });
            }

            function confirmPayment() {

                var invoice = sessionStorage.getItem("invoiceId");
                var token = localStorage.getItem("token");
                var headers = {
                    "Authorization": "Bearer " + token,
                };

                $.ajax({
                    url: "http://localhost:1212/api/v1/user/confirm-payment?invoiceId=" + invoice,
                    type: "POST",
                    headers: headers,
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    success: function (response) {
                        window.location.href = "userbookings";
                    },
                    error: function (e) {
                        console.log("Something Went Wrong:", e);
                    }
                });

            }

            function arrayToList(selectedSeatsString) {
                if (selectedSeatsString) {
                    const selectedSeatsArray = selectedSeatsString.split(',');
                    const selectedSeats = selectedSeatsArray.map(seat => parseInt(seat, 10));
                    return selectedSeats;
                } else {
                    console.log("No booked seats found in sessionStorage");
                }
            }

            //byte array to a base64-encoded string
            function arrayBufferToBase64(buffer) {
                var binary = '';
                var bytes = new Uint8Array(buffer);
                var len = bytes.byteLength;
                for (var i = 0; i < len; i++) {
                    binary += String.fromCharCode(bytes[i]);
                }
                return btoa(binary);
            }

            document.addEventListener('DOMContentLoaded', function () {
                toggleLoginLogout();
            });

            var isAuthenticated;

            function toggleLoginLogout() {
                var token = localStorage.getItem('token');

                if (token) {
                    document.getElementById("loginButton").style.display = "none";
                    isAuthenticated = true;

                } else {
                    document.getElementById("logout").style.display = "none";
                    isAuthenticated = false;
                }
            }

            function performLogout() {
                if (isAuthenticated) {
                    localStorage.clear();
                    sessionStorage.clear();
                    window.location.replace("home");
                    document.getElementById("logout").style.display = "none";

                } else {
                    window.location.href = "loginpage";
                }
            }

            //navigation bar
            function openNav() {
                document.getElementById("myNav").style.width = "20%";
            }

            function closeNav() {
                document.getElementById("myNav").style.width = "0%";
            }

            function goBack() {
                window.history.back();
            }

        </script>
    </head>

    <body id="body">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light ">
            <a class="navbar-brand" href="home"> <img src="/movie/logo1.png" alt="Logo" height="40"> </a>
            <span style="font-size:20px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span>
            <!-- Search Bar -->
            <form class="form-inline my-2 my-lg-0 mx-auto">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn searchbutton  my-2 my-sm-0" type="submit">Search</button>
            </form>

            <div class="loginbtn" id="loginButtonContainer">
                <button id="loginButton" class="btn mr-2" onclick="performLogout()">Login</button>
            </div>

            <div id="myNav" class="overlay left">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <i style="font-size:40px;color:lightblue;text-shadow:2px 2px 4px #000000; margin-left: 15px;"> <img
                        src="/movie/logo1.png" alt="Logo" height="40"> </i>
                <div class="overlay-content">
                    <a href="#">About</a>
                    <a type="button" href="userbookings">Bookings</a>
                    <a href="#">Help & Support</a>
                    <a href="#">Contact</a>
                    <a href="#" id="logout" onclick="performLogout()">Logout</a>

                </div>
            </div>
            <!-- <span style="font-size:30px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span> -->
            <!-- <i onclick="" id="btn" class="fa fa-user fa-2x" aria-hidden="true"></i> -->
            <!-- <i onclick="" id="btn" class="fa-solid fa-backward-step" ></i> -->
            <button onclick="goBack()" type="button" class="btn backbtn">Back</button>
        </nav>

        <div id="showContainer">
        </div>
    </body>

    </html>