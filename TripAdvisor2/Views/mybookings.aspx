<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mybookings.aspx.cs" Inherits="TripAdvisor2.Views.mybookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/lux/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
                                <a class="nav-link active" href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample">Login<span class="visually-hidden">(current)</span>
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

            <div class="container" style="margin-top: 100px">
                <div runat="server" id="divWelcome" hidden="hidden">
                    Welcome
                    <h1 id="lblName" runat="server"></h1>
                </div>

                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                    <asp:Repeater ID="repBooking" runat="server">
                        <HeaderTemplate></HeaderTemplate>
                        <ItemTemplate>
                            <div class="col">
                                <div class="card h-100 shadow-sm border-0 rounded-4">
                                    <img src='<%# Eval("Photo") %>' class="card-img-top rounded-top-4 object-fit-cover" style="height: 220px;" alt="Accommodation photo" />
                                    <div class="card-body d-flex flex-column justify-content-between">
                                        <div>
                                            <h5 class="card-title mb-2 fw-semibold text-primary"><%# Eval("Name") %></h5>
                                            <p class="card-text mb-1"><strong>Check-in:</strong> <%# Eval("Checkin") %></p>
                                            <p class="card-text mb-1"><strong>Check-out:</strong> <%# Eval("Checkout") %></p>
                                            <p class="card-text mb-1"><strong>Adults:</strong> <%# Eval("Adults") %></p>
                                            <p class="card-text mb-1"><strong>Kids:</strong> <%# Eval("Kids") %></p>
                                            <p class="card-text mb-3"><strong>Rooms:</strong> <%# Eval("Rooms") %></p>
                                            <p class="card-text fw-bold text-end text-success mb-2">Total: <%# Eval("TotalCost") %></p>
                                        </div>
                                        <div class="mt-auto">
                                            <hr />
                                            <button id="btnDelete" runat="server" class="btn btn-danger" dataid='<%# Eval("Id")%>' onserverclick="btnDelete_ServerClick">Cancel booking</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate></FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

