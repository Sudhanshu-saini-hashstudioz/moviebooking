<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!doctype html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>Booking Data</title>
        <link rel="icon"
            href="data:image/png;base64,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" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>

            var isAuthenticated;

            $(document).ready(function () {
                var token = localStorage.getItem("token");
                var headers = {
                    "Authorization": "Bearer " + token,
                };

                $.ajax({
                    url: "http://localhost:1212/api/v1/user/getallinvoices",
                    type: "GET",
                    headers: headers,
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    data: {
                        email: sessionStorage.getItem("user")
                    },
                    success: function (response) {
                        isAuthenticated = true;
                        var invoices = JSON.parse(JSON.stringify(response));
                        populateInvoiceTable(invoices);
                    },
                    error: function (e) {
                        console.log("Something Went Wrong:", e);
                        window.location.replace("http://localhost:1212/movie/home");
                    }
                });

            });


            function populateInvoiceTable(invoices) {
                var tableBody = $("table tbody");
                tableBody.empty();

                $.each(invoices, function (index, invoice) {
                    var row = $('<tr>');
                    // row.append($('<th>').text(invoice.orderId));
                    if (invoice.payment_status === "failed" || invoice.payment_status === "attempted" || invoice.payment_status === "Created" ||  invoice.payment_status === "created") {

                    } else {

                        row.append($('<td>').text(invoice.show.upcomingShows));
                        row.append($('<td>').text(invoice.show.runningTime));
                        row.append($('<td>').text(invoice.show.theatre.theatreName));
                        row.append($('<td>').text(invoice.totalTickets));
                        row.append($('<td>').text(invoice.booked_date));
                        row.append($('<td>').text(invoice.payment_status));
                        var actionColumn = $("<td>");

                        if (invoice.payment_status === "paid") {

                            actionColumn.append('<i onclick="downloadTicket(\'' + invoice.invoiceId + '\')" class="fa fa-download" id="actionbtn" type="button" aria-hidden="true"></i>');
                            actionColumn.append('<i onclick="cancelTicket(\'' + invoice.invoiceId + '\')" class="fa fa-times" id="actionbtn" type="button" aria-hidden="true"></i>');
                            // actionColumn.append('<i onclick="shareTicket(\'' + invoice.invoiceId + '\')" class="fa fa-share" id="actionbtn" type="button" aria-hidden="true"></i>');

                        } else if (invoice.payment_status === "Canceled") {

                            actionColumn.append('<p>Refunded</p>')
                            // actionColumn.append('<i onclick="repayment(\'' + invoice.orderId + '\' , \'' + invoice.invoiceId + '\') "><button type="button" class="btn">Pay</button></i>');

                        }

                        row.append(actionColumn);
                        tableBody.append(row);

                    }

                });
            }


            function repayment(orderId, invoiceId) {

                var token = localStorage.getItem("token");
                var headers = {
                    "Authorization": "Bearer " + token,
                };

                $.ajax({
                    url: "http://localhost:1212/api/v1/user/repayment",
                    type: "GET",
                    headers: headers,
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    data: {
                        invoiceId: invoiceId,
                    },
                    success: function (response) {

                        if (response === "paid") {

                            window.location.reload();

                        } else {

                            // window.location.href = "payment";
                            var headers = {
                                "Authorization": "Bearer " + token,
                            };
                            $.ajax({
                                url: "http://localhost:1212/api/v1/user/getinvoicebyid",
                                type: "GET",
                                headers: headers,
                                contentType: 'application/json; charset=utf-8',

                                data: {
                                    invoiceId: invoiceId,
                                },
                                async: false,

                                success: function (invoice) {
                                    invoice = JSON.parse(JSON.stringify(invoice));
                                    var orderId = invoice.orderId;

                                    let option = {
                                        key: "rzp_test_2ZbY5hDyVZAQVh",
                                        amount: invoice.amount,
                                        currency: "INR",
                                        order_id: orderId,
                                        name: invoice.show.upcomingShows,
                                        description: invoice.seatNumber + "",
                                        image: "http://localhost:1212/movie/logo1.png",

                                        handler: function (response) {
                                            confirmPayment(invoiceId, invoice.seatNumber);
                                        },

                                        prefill: {
                                            name: "",
                                            email: invoice.userId,
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


                                        var token = localStorage.getItem("token");
                                        var headers = {
                                            "Authorization": "Bearer " + token,
                                        };

                                        $.ajax({
                                            url: "http://localhost:1212/api/v1/user/repaymentfailed",
                                            type: "GET",
                                            headers: headers,
                                            contentType: 'application/json; charset=utf-8',
                                            async: false,
                                            data: {
                                                id: invoiceId
                                            },
                                            success: function (response) {
                                                var invoices = JSON.parse(JSON.stringify(response));
                                                populateInvoiceTable(invoices);
                                                window.location.reload();
                                            },
                                            error: function (e) {
                                                console.log("Something Went Wrong:", e);
                                                window.location.replace("http://localhost:1212/movie/home");
                                            }
                                        });




                                        console.log(response);
                                    });
                                    rzp.open();

                                },
                                error: function (e) {
                                    console.log(e);
                                }
                            });
                        }

                    },
                    error: function (e) {
                        alert("Seat Are Not Available");
                        console.log("Something Went Wrong:", e);
                    }
                });

            }

            function confirmPayment(invoiceId, seatNumber) {

                var invoice = invoiceId;
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
                        alert("Seat: " + seatNumber + " Not Available.");
                        // console.log("Something Went Wrong:", e);
                    }
                });

            }

            function downloadTicket(invoiceId) {

                var url = "http://localhost:1212/api/v1/auth/downloadTicket?id=" + invoiceId;
                var xhr = new XMLHttpRequest();

                xhr.open("GET", url, true);
                xhr.responseType = "blob";

                // handleling the response
                xhr.onload = function () {
                    if (xhr.status === 200) {

                        var blob = new Blob([xhr.response], { type: "application/pdf" });
                        var url = URL.createObjectURL(blob);

                        // Create a link element to trigger the download
                        var a = document.createElement("a");
                        a.href = url;
                        a.download = "ticket.pdf";
                        document.body.appendChild(a);

                        // Trigger the click event on the link to start the download
                        a.click();

                        // Remove the link element from the DOM
                        document.body.removeChild(a);
                    }
                };
                xhr.send();
            }

            function cancelTicket(invoiceId) {

                var headers = {
                    "Authorization": "Bearer " + localStorage.getItem("token"),
                };
                $.ajax({
                    url: "http://localhost:1212/api/v1/user/cancelTicket?id=" + invoiceId,
                    type: "POST",
                    headers: headers,
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    success: function (response) {

                        //alert(response);
                        window.location.reload();

                        $.ajax({
                            url: "http://localhost:1212/api/v1/user/sendMail?id=" + response,
                            type: "POST",
                            headers: headers,
                            contentType: 'application/json; charset=utf-8',
                            async: false,
                            success: function (response) {


                            },
                            error: function (e) {
                                alert("error")
                                window.location.reload();
                            }
                        });


                    },
                    error: function (e) {
                        alert("error")
                        window.location.reload();
                    }
                });


            }


            // function shareTicket(invoiceId) {

            //     token = localStorage.getItem("token");
            //     var headers = {
            //         "Authorization": "Bearer " + token,
            //     };
            //     $.ajax({
            //         url: "http://localhost:1212/api/v1/user/sendemail?id=" + invoiceId,
            //         type: "POST",
            //         headers: headers,
            //         contentType: 'application/json; charset=utf-8',
            //         async: false,
            //         success: function (response) {

            //         },
            //         error: function (e) {
            //             alert("error")
            //             window.location.reload();
            //         }
            //     });

            // }

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
                    window.location.href = "loginpage";

                }
            }


            function showConfirmationDialog() {
                var confirmationMessage = "Are you sure you want to delete data ?"
                return confirm(confirmationMessage);
            }

            function confirmDelete() {
                return confirm("Are you sure you want to Delete the data?");
            }


            document.addEventListener('DOMContentLoaded', function () {
                toggleLoginLogout();
            });

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

        <style>
            body {
                font-family: 'Lato', sans-serif;
            }

            .navbar {
                background-color: oldlace;
            }

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
                transition: 0.2s;
                border-color: lavender;
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

            .btn:hover {
                color: darksalmon;
                transition: transform 0.3s ease-out;
                transform: scale(1.15);
            }


            table {
                align-content: center;
                font-family: arial, sans-serif;
                border-collapse: collapse;
            }

            table,
            th,
            td {
                border: 1px solid grey;
            }


            tbody {
                max-height: 600px;
                overflow-y: auto;
            }

            td,
            th {
                width: auto;
                text-align: center;
                padding: 8px;
            }

            tr,
            th {
                margin: 6px;
            }

            tr:nth-child(even) {
                background-color: rgb(221, 221, 221);
            }

            .btn {
                margin-left: 5px;
                margin-right: 5px;
                color: maroon;
                background-color: lavender;
                border-radius: 10px;
            }

            i {
                cursor: pointer;
            }

            i:hover {
                transition: transform 0.1s ease-out;
                transform: scale(1.30);
                box-shadow: 0 0 10px rgb(221, 221, 221, 0.5);
                z-index: 3;

            }

            /* .tableBody {
                background: transparent;
                backdrop-filter: blur(10px);

            } */

            .row {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-left: 100px;
                margin-right: 100px;
                margin-top: 30px;
                margin-bottom: 30px;
            }

            #actionbtn {
                padding: 5px;
                margin-left: 5px;
                margin-right: 5px;
                margin: 5px;
            }
        </style>
    </head>
    <!-- style="background-image: url(http://localhost:1212/movie/logo1.png);" -->

    <body>

        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light ">
            <a class="navbar-brand" href="home"> <img src="/movie/logo1.png" alt="Logo" height="40"> </a>
            <span style="font-size:20px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span>

            <!-- Search Bar -->
            <form class="form-inline my-2 my-lg-0 mx-auto">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <i type="button" class="fas fa-search " aria-hidden="true"></i>
            </form>

            <div id="myNav" class="overlay left">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <i style="margin-left: 20px ; font-size:40px;color:lightblue;text-shadow:2px 2px 4px #000000;"> <img
                        src="/movie/logo1.png" alt="Logo" height="40"> </i>
                <div class="overlay-content">
                    <a href="#">About</a>
                    <a type="button" href="userbookings">Bookings</a>
                    <a href="#">Help & Support</a>
                    <a href="#">Contact</a>
                    <a href="#" id="logout" onclick="performLogout()">Logout</a>
                </div>
            </div>
            <i onclick="goBack()" class="fa-solid fa-arrow-left" aria-hidden="true"></i>
        </nav>

        <div>

            <div class="row">
                <h3 class="text-center mb-3"> Booked Tickets</h3>

                <table class="tableBody">
                    <thead class="thead-dark" style=" color:black;">
                        <tr style="background-color: rgb(209, 70, 70); color: whitesmoke;">
                            <!-- <th scope="col">Order_id</th> -->
                            <th scope="col">Title</th>
                            <th scope="col">Time</th>
                            <th scope="col">Theatre</th>
                            <!-- <th scope="col">City</th> -->
                            <th scope="col">Tickets</th>
                            <!-- <th scope="col">Booking Seat</th> -->
                            <th scope="col">Booking Date</th>
                            <th scope="col">Payment Status</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                    </tbody>

                </table>

            </div>

        </div>

    </body>

    </html>