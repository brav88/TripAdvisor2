<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TripAdvisor2.index" %>

<%--<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>--%>

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
                                    <a id="actionLogout" runat="server" onserverclick="actionLogout_ServerClick" class="dropdown-item" href="#">Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="container" style="margin-top: 100px">
                
                <div runat="server" id="divWelcome" hidden="hidden">
                    Welcome <h1 id="lblName" runat="server"></h1>
                </div>                

                <div class="row row-cols-4">
                    <asp:Repeater ID="repResorts" runat="server">
                        <HeaderTemplate></HeaderTemplate>
                        <ItemTemplate>
                            <div class="col">
                                <div class="card" style="width: 18rem;">
                                    <img style="height: 250px; width: 18rem" src="<%#Eval("Photo")%>" class="card-img-top" alt="..." />
                                    <div class="card-body">
                                        <h5 class="card-title"><%#Eval("Name")%></h5>
                                        <p class="card-text"><%#Eval("Description")%></p>
                                        <a href="booking.aspx?id=<%#Eval("Id")%>" class="btn btn-primary">Book $<%#Eval("Price")%></a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate></FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <%--OFF CANVA--%>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasExampleLabel">Login</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <div class="card shadow-lg p-4">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input runat="server" type="email" id="txtEmail" name="Email" class="form-control" required="required" value="brav88@hotmail.com" />
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input runat="server" type="text" id="txtPwd" name="Password" class="form-control" required="required" value="Admin$1234"/>
                        </div>
                        <button id="btnLogin" runat="server" type="submit" class="btn btn-primary w-100" onserverclick="btnLogin_ServerClick">Login</button>

                        <div class="text-center mt-3">
                            <a>Don't have an account? Sign up</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
