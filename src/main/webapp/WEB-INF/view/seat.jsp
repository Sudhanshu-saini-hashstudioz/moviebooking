<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Seat Selection</title>

        <link rel="icon"
            href="data:image/png;base64,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" />

        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: 'Lato', sans-serif;
            }

            .navbar {
                display: flex;
                flex:auto;
                background-color: whitesmoke;
            }

            .overlay {
                position: fixed;
                top: 0;
                right: -50%;
                width: 0%;
                height: 100%;
                background-color: whitesmoke;
                overflow-x: hidden;
                transition: 0.5s;

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
                color: #0a0a0a;
                display: block;
                transition: 0.3s;
                border-color: grey;
                border-block: inherit;
            }

            .overlay a:hover,
            .hamburger:hover,
            .btn:hover,
            .overlay a:focus {
                color: #f1f1f1;
                background-color: rgb(235, 84, 84);
                border-radius: 10px;
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

            .row {
                grid-template-columns: repeat(20, 1fr);
                display: flex;
                padding: 5px;
                flex-direction: row;
            }


            body {
                width: 100%;
                height: 100vh;
                margin: 0;
                padding: 0;
            }

            .btn,
            #btn {
                color: black;

                cursor: pointer;
            }

            .btn {
                background-color: #dfdfdf;
                border-radius: 10px;
            }

            .center {
                width: 100%;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                background: linear-gradient(to right,
                        white,
                        white);
            }

            .tickets {
                width: fit-content;
                height: fit-content;
                border: 0.4mm solid rgba(0, 0, 0, 0.08);
                border-radius: 3mm;
                box-sizing: border-box;
                padding: 10px;
                font-family: poppins;
                max-height: 96vh;
                overflow: auto;
                background: white;
                box-shadow: 0px 25px 50px -12px rgba(0, 0, 0, 1.0);
            }

            .ticket-selector {
                background: rgb(243, 243, 243);
                display: flex;
                align-items: center;
                justify-content: space-between;
                flex-direction: column;
                box-sizing: border-box;
                padding: 20px;
            }

            .head {
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 30px;
            }

            .title {
                font-size: 16px;
                font-weight: 600;
            }

            .seats {
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                min-height: 150px;
                position: relative;
            }

            .status {
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: space-evenly;
            }

            .seats::before {
                content: "";
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translate(-50%, 0);
                width: 220px;
                height: 7px;
                background: rgb(141, 198, 255);
                border-radius: 0 0 3mm 3mm;
                border-top: 0.3mm solid rgb(180, 180, 180);
            }

            .item {
                font-size: 12px;
                position: relative;
            }

            .item::before {
                content: "";
                position: absolute;
                top: 50%;
                left: -12px;
                transform: translate(0, -50%);
                width: 10px;
                height: 10px;
                background: rgb(255, 255, 255);
                outline: 0.2mm solid rgb(120, 120, 120);
                border-radius: 0.3mm;
            }

            .item:nth-child(2)::before {
                background: rgb(180, 180, 180);
                outline: none;
            }

            .item:nth-child(3)::before {
                background: rgb(28, 185, 120);
                outline: none;
            }

            .all-seats {
                display: grid;
                grid-template-columns: repeat(10, 1fr);
                grid-gap: 15px;
                margin: 60px 0;
                margin-top: 20px;
                position: relative;
            }

            .seat {
                width: 20px;
                height: 20px;
                background: white;
                border-radius: 0.5mm;
                outline: 0.3mm solid rgb(180, 180, 180);
                cursor: pointer;

            }

            .all-seats input:checked+label {
                background: rgb(28, 185, 120);
                outline: none;
            }

            .seat.booked {
                background: rgb(180, 180, 180);
                outline: none;
            }

            input {
                display: none;
            }

            .price {
                width: 100%;
                box-sizing: border-box;
                padding: 10px 20px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .total {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: center;
                font-size: 16px;
                font-weight: 500;
            }

            .total span {
                font-size: 11px;
                font-weight: 400;
            }

            .price button {
                background: rgb(60, 60, 60);
                color: white;
                font-family: poppins;
                font-size: 14px;
                padding: 7px 14px;
                border-radius: 2mm;
                outline: none;
                border: none;
                cursor: pointer;
            }
            .backbtn{
                right: 0px;
            }


            #loginbutton,
            #logout {}

            .logobtn {
                top: 15px;
                left: 10px;
            }

            #profilebtn {
                cursor: pointer;
            }
        </style>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>

            $(document).ready(function () {
                $.ajax({
                    url: "http://localhost:1212/api/v1/auth/availableseat",
                    type: "GET",
                    contentType: 'application/json; charset=utf-8',
                    data: {
                        id: localStorage.getItem("showId")
                    },
                    async: false,
                    success: function (response) {
                        var seats = JSON.parse(JSON.stringify(response));
                        populateSeat(seats);
                    },
                    error: function (e) {
                        window.location.replace("http://localhost:1212/movie/home");
                    }
                });

            });

            var selectedSeats = [];
            var bookedSeats = [];

            function populateSeat(seats) {
                var find = document.getElementById("seats");

                for (var i = localStorage.getItem("capacity"); i > 0; i--) {
                    var input = document.createElement("input");
                    input.setAttribute("type", "checkbox");
                    input.setAttribute("name", "tickets");
                    input.setAttribute("id", "s" + i);

                    input.addEventListener("change", function (event) {
                        var seatNumber = parseInt(event.target.id.substring(1));
                        updateSeatStatus(seatNumber, event.target.checked);
                    });

                    var label = document.createElement("label");
                    label.setAttribute("for", "s" + i);

                    if (!seats.includes(i)) {
                        bookedSeats.push(i);
                        label.className = "seat booked";
                        input.disabled = true; // Disable the checkbox for booked seats
                    } else {
                        label.className = "seat available";
                    }
                    find.appendChild(input);
                    find.appendChild(label);

                }
            }

            function updateSeatStatus(seatNumber, isChecked) {
                var seatLabel = document.getElementById("s" + seatNumber);

                if (!bookedSeats.includes(seatNumber)) {
                    if (isChecked) {
                        seatLabel.classList.remove("available");
                        seatLabel.classList.add("selected");
                        selectedSeats.push(seatNumber);
                    } else {
                        seatLabel.classList.remove("selected");
                        seatLabel.classList.add("available");
                        selectedSeats = selectedSeats.filter(seat => seat !== seatNumber);
                    }
                    updateTotal(seatNumber, isChecked);
                } else {
                    // Reset the checkbox state if the seat is booked
                    seatLabel.checked = false;
                }
            }

            var amount = 0;
            function updateTotal(seatNumber, isChecked) {
                if (isChecked) {
                    if (seatNumber <= 80) {
                        amount += 250;
                    } else if (seatNumber > 80 && seatNumber <= 120) {
                        amount += 350;
                    } else {
                        amount += 500;
                    }
                } else {
                    if (seatNumber <= 80) {
                        amount -= 250;
                    } else if (seatNumber > 80 && seatNumber <= 120) {
                        amount -= 350;
                    } else {
                        amount -= 500;
                    }

                }

                var countElement = document.querySelector(".count");
                var amountElement = document.querySelector(".amount");
                countElement.textContent = selectedSeats.length;
                amountElement.textContent = amount;
            }

            function getinvoice() {
                selectedSeats.sort();
                sessionStorage.setItem("bookedSeat", selectedSeats);
                sessionStorage.setItem("amount", amount);
                if (selectedSeats.length > 0) {
                    window.location.replace("http://localhost:1212/movie/payment");
                } else {
                    alert("Please select Atleast one Seat .")
                }


                // var showId = localStorage.getItem("showId");
                // token = localStorage.getItem("token");
                // var headers = {
                //     "Authorization": "Bearer " + token,
                // };
                // $.ajax({
                //     url: "http://localhost:1212/api/v1/user/getinvoice",
                //     type: "POST",
                //     headers:headers,
                //     contentType: 'application/json; charset=utf-8',
                //     data: JSON.stringify({
                //         show:{
                //             showId:showId
                //         },
                //         totalTickets:selectedSeats.length,
                //         bookingSeat :selectedSeats,
                //         amount:amount
                //     }),
                //     async: false,
                //     success: function (response) {
                //         var invoice = JSON.parse(JSON.stringify(response));
                //         localStorage.setItem("invoice", invoice);
                //         window.location.replace("http://localhost:1212/movie/movie");
                //     },
                //     error: function (e) {
                //         window.location.replace("http://localhost:1212/movie/loginpage");
                //     }
                // });


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
                    window.location.reload();
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

    <body>

        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light ">
            <a class="navbar-brand" href="home"> <img src="/movie/logo1.png" alt="Logo" height="40"> </a>
            <span style="font-size:20px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span>


            <!-- Search Bar -->
            <form display="none" class="form-inline my-2 my-lg-0 mx-auto">
                <input class="form-control mr-sm-2 search-input" type="search" display="none" placeholder="Search" aria-label="Search">
                <button class="btn searchbutton  my-2 my-sm-0" type="button" display="none" onclick="searchByName()">Search</button>
            </form>

            <div class="loginbtn" id="loginButtonContainer">
                <button id="loginButton" class="btn mr-2" onclick="performLogout()">Login</button>
            </div>


            <div id="myNav" class="overlay left">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <i style="font-size:40px;color:lightblue;text-shadow:2px 2px 4px #000000;margin-left: 15px;"> <img
                        src="/movie/logo1.png" alt="Logo" height="40"> </i>
                <div class="overlay-content">
                    <a href="#">About</a>
                    <a type="button" href="getuserbookings">Bookings</a>
                    <a href="#">Help & Support</a>
                    <a href="#">Contact</a>
                    <a href="#" id="logout" onclick="performLogout()">Logout</a>

                </div>
            </div>

            <button onclick="goBack()" type="button" class="btn backbtn">Back</button>
        </nav>


        <div class="center">
            <div class="tickets">
                <div class="ticket-selector">
                    <div class="head">
                        <div class="title">Movie Name</div>
                    </div>
                    <div class="seats">
                        <div class="status">
                            <div class="item">Available</div>
                            <div class="item">Booked</div>
                            <div class="item">Selected</div>
                        </div>
                        <div class="all-seats" id="seats"> </div>
                    </div>
                </div>
                <div class="price">
                    <div class="total">
                        <span> <span class="count">0</span> Tickets </span>
                        <div class="amount">0</div>
                    </div>
                    <button type="button" onclick="getinvoice()">Book</button>
                </div>
            </div>
        </div>
    </body>

    </html>