<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="TripAdvisor2.Views.booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/lux/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="../Assets/js/site.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.aspx">Home - Trip Advisor</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarColor02">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample">Login
                        <span class="visually-hidden">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Features</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Pricing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="container mt-5">
                <h1 class="fw-bold text-center text-primary mb-4">Welcome, <span id="lblName" runat="server"></span></h1>

                <div class="row g-4">
                    <!-- Card: Resort Info -->
                    <div class="col-lg-4">
                        <div class="card shadow-lg border-0 rounded-4">
                            <img runat="server" id="imgResort" class="card-img-top rounded-top-4" src="" alt="Resort Image" style="height: 250px; object-fit: cover;">
                            <div class="card-body text-center">
                                <h2 runat="server" id="lblResortName" class="fw-bold"></h2>
                                <p runat="server" id="lblDescription" class="text-muted"></p>
                            </div>
                        </div>
                    </div>

                    <!-- Card: Booking Form -->
                    <div class="col-lg-8">
                        <div class="card shadow-lg border-0 rounded-4">
                            <div class="card-header bg-primary text-white fw-bold text-center">
                                Set your booking for $<span id="lblPrice" runat="server"></span> per person per night
                            </div>
                            <div class="card-body p-4">

                                <!-- Dates Selection -->
                                <div class="mb-4">
                                    <h5 class="fw-bold"><i class="fa-solid fa-calendar-days text-primary"></i>Your booking dates</h5>
                                    <div class="row g-2">
                                        <div class="col">
                                            <input type="date" class="form-control rounded-3" id="DateIn" />
                                        </div>
                                        <div class="col">
                                            <input type="date" class="form-control rounded-3" id="DateOut" onchange="calcNights()" />
                                        </div>
                                    </div>
                                </div>

                                <hr />

                                <!-- Guests and Rooms -->
                                <div class="row text-center g-3">
                                    <div class="col">
                                        <label for="txtAdults" class="fw-bold text-muted d-block">
                                            <i class="fa-solid fa-people-group text-primary"></i>Adults
                                        </label>
                                        <input type="number" value="2" max="5" min="1" class="form-control text-center rounded-3" id="txtAdults" onchange="calcPeople()" />
                                    </div>
                                    <div class="col">
                                        <label for="txtKids" class="fw-bold text-muted d-block">
                                            <i class="fa-solid fa-children text-primary"></i>Kids
                                        </label>
                                        <input type="number" value="0" max="4" min="0" class="form-control text-center rounded-3" id="txtKids" onchange="calcPeople()" />
                                    </div>
                                    <div class="col">
                                        <label for="txtRooms" class="fw-bold text-muted d-block">
                                            <i class="fa-solid fa-house text-primary"></i>Rooms
                                        </label>
                                        <input type="number" value="2" max="4" min="1" class="form-control text-center rounded-3" id="txtRooms" />
                                    </div>
                                </div>

                                <hr />

                                <!-- Booking Summary -->
                                <div class="row g-3 text-center">
                                    <div class="col">
                                        <h5 class="text-muted fw-bold">
                                            <label id="lblNights">2</label>
                                            Nights <i class="fa-solid fa-moon text-primary"></i>
                                            for 
                                            <label id="lblPeople">2</label>
                                            people</h5>
                                    </div>
                                    <div class="col">
                                        <h5 class="text-muted fw-bold"><i class="fa-solid fa-money-bill-trend-up"></i>Taxes: $25</h5>
                                    </div>
                                    <div class="col">
                                        <h4 class="fw-bold"><i class="fa-solid fa-money-check-dollar"></i>$<label id="lblTotal" runat="server"></label></h4>
                                    </div>
                                </div>

                                <div class="text-center mt-4">
                                    <button class="btn btn-lg btn-primary px-4 fw-bold shadow-sm">
                                        Confirm Booking                       
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    </form>
</body>
</html>
