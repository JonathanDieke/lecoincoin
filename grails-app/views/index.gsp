<!doctype html>
<html>
<head>
    <meta name="layout" content="my-layout"/>
    <title>Welcome to Grails</title>
</head>

<body>

<div id="content" role="main" class="container-fluid">

    <h1 class="text-dark font-weight-bold">Bienvenue sur Lecoincoin</h1>

    <section class="row colset-2-its mx-auto row py-3">
        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
            <div class="card col-12 col-lg-5 p-0 " style="width: 18rem; height: 9rem">
                <div class="card-body text-center">
                    <i class="fa fa-user-friends fa-3x"></i>
                </div>

                <div class="card-footer text-center">
                    <a href="/user/index">
                        Liste des utilisateurs
                    </a>
                </div>
            </div>

            <div class="card col-12 col-lg-5 ml-auto mt-3 mt-lg-0 p-0" style="width: 18rem; height: 9rem">
                <div class="card-body text-center">
                    <i class="fa fa-user-plus fa-3x"></i>
                </div>

                <div class="card-footer text-center ">
                    <sec:ifNotGranted roles="ROLE_ADMIN">
                        <a href="#" class="text-muted font-italic">
                        <i class="fa fa-lock">
                    </sec:ifNotGranted>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <a href="user/create">
                    </sec:ifAllGranted>

                            Ajouter un utilisateur
                        </i>
                    </a>
                </div>
            </div>
        </sec:ifAnyGranted>

        <div class="card col-12 col-lg-5 mt-3 p-0 ml-1 " style="width: 18rem; height: 9rem">
            <div class="card-body text-center">
                <i class="fa fa-newspaper fa-3x"></i>
            </div>

            <div class="card-footer text-center ">
                <a href="/annonce/index">
                    Liste des annonces
                </a>
            </div>
        </div>

        <div class="card col-12 col-lg-5 ml-auto mt-3 p-0" style="width: 18rem; height: 9rem">
            <div class="card-body text-center">
                <i class="fa fa-cart-plus fa-3x"></i>
            </div>

            <div class="card-footer text-center ">
                <a href="annonce/create">
                    Ajouter une annonce
                </a>
            </div>
        </div>

    </section>
</div>

</body>
</html>
