<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">

    <head>
        <title>Login page | Lecoincoin</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
         <style>
             body {
                 margin: 0;
                 padding: 0;
                 background-color: rgba(0, 123, 255, 0.7);
                 height: 100vh;
             }
             #login .container #login-row #login-column #login-box {
                 margin-top: 120px;
                 max-width: 600px;
                 height: fit-content;
                 border: 1px solid gray;
                 /*background-color: #EAEAEA;*/
                 background-color: rgba(255, 255, 255, 0.9);
             }
             #login .container #login-row #login-column #login-box #login-form {
                 padding: 20px;
             }
             #login .container #login-row #login-column #login-box #login-form #register-link {
                 margin-top: -85px;
             }
         </style>
    </head>

<body>
<div id="login">

    <h3 class="text-center text-white pt-5">LECOINCOIN</h3>

    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div id="login-box" class="col-md-12">
                    <form id="login-form" class="form" action="${postUrl ?: '/login/authenticate'}" method="POST">
                        <h3 class="text-center mb-4">Page de connexion</h3>
                        <div class="form-group">
                            <label for="username" >Nom d'utilisateur :</label>
                            <input type="text"  name="${usernameParameter ?: 'username'}" id="username" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="password">Mot de passe :</label>
                            <input type="password" name="${passwordParameter ?: 'password'}" id="password" class="form-control">
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="remember_me" name="${rememberMeParameter ?: 'remember-me'}" <g:if test='${hasCookie}'>checked="checked"</g:if>>
                            <label class="form-check-label" for="remember_me"> Se souvenir de moi</label>
                        </div>
                        <button type="submit" class="btn btn-outline-primary text-dark">Connexion</button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    (function() {
        document.forms['login-form'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</html>
