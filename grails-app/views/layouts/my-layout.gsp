<%--
  Created by IntelliJ IDEA.
  User: loulo
  Date: 15/12/2022
  Time: 15:55
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Lecoincoin</title>

    <!-- Custom fonts for this template-->
    <asset:stylesheet src="sb-admin/sb-admin-2.min.css"/>
    <asset:stylesheet src="sb-admin/all.min.css"/>
    <asset:stylesheet src="paginator.css"/>
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <g:layoutHead/>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
        <g:link class="sidebar-brand d-flex align-items-center justify-content-center" mapping="home">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>

            <div class="sidebar-brand-text mx-3">Lecoincoin</div>
        </g:link>

    <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Accueil -->
        <li class="nav-item active">
            <g:link class="nav-link" mapping="home">
                <i class="fas fa-fw fa-home"></i>
                <span>Accueil</span></g:link>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Menu
        </div>

    <!-- Nav Item - User Collapse Menu -->
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MODERATOR">
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                   aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-user-friends"></i>
                    <span>Utilisateurs</span>
                </a>

                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Sous-menu</h6>
                        <a class="collapse-item" href="/user/index">
                            Lister les utilisateurs</a>
                        <a class="collapse-item" href="/user/create">Cr??er un utilisateur</a>
                    </div>
                </div>
            </li>
        </sec:ifAnyGranted>



    <!-- Nav Item - Ads Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-newspaper"></i>
                <span>Les annonces</span>
            </a>

            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Sous-menu</h6>
                    <a class="collapse-item" href="/annonce/index">Lister les annonces</a>
                    <a class="collapse-item" href="/annonce/create">Cr??er une annonce</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->
                %{--                <form--}%
                %{--                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">--}%
                %{--                    <div class="input-group">--}%
                %{--                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."--}%
                %{--                               aria-label="Search" aria-describedby="basic-addon2">--}%
                %{--                        <div class="input-group-append">--}%
                %{--                            <button class="btn btn-primary" type="button">--}%
                %{--                                <i class="fas fa-search fa-sm"></i>--}%
                %{--                            </button>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%
                %{--                </form>--}%

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">

                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                <!-- Nav Item - User Information -->
                    <sec:ifLoggedIn>
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Bonjour
                                <span class="mx-2 d-none d-lg-inline text-gray-900 small text-uppercase"><sec:loggedInUserInfo
                                        field="username"/></span>
                                <img class="img-profile rounded-circle ml-2 ml-lg-0"
                                     src="https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U">

                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                 aria-labelledby="userDropdown">
                                <a class="dropdown-item" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    D??connexion
                                </a>
                            </div>
                        </li>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-primary " href="/login/auth">Se connecter</a>
                        </li>
                    </sec:ifNotLoggedIn>

                </ul>

            </nav>
            <!-- End of Topbar -->

            %{--            <g:layoutHeading/>--}%

            <!-- Begin Page Content -->
            <g:layoutBody/>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white mt-4">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; All rights reserved - Jonathan DIEKE / Serge DOUDOU</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Se d??connecter</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">??</span>
                </button>
            </div>

            <div class="modal-body">Voulez-vous vraiment mettre fin ?? votre session ?</div>

            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Annuler</button>
                <a class="btn btn-primary" href="/logout/index">D??connexion</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<asset:javascript src="sb-admin/jquery.min.js"/>
<asset:javascript src="sb-admin/bootstrap.bundle.js"/>

<!-- Core plugin JavaScript-->
<asset:javascript src="sb-admin/jquery.easing.min.js"/>
<!-- Custom scripts for all pages-->
<asset:javascript src="sb-admin/sb-admin-2.min.js"/>

</body>

</html>