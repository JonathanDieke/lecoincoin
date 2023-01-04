<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="my-layout" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="container-fluid d-sm-flex align-items-center justify-content-between mb-4">
            <h1  class="mb-3 text-dark">
                <g:message code="default.show.label" args="[entityName]"/>
            </h1>
        </div>

        <div id="show-user" class="content scaffold-show container-fluid " role="main">

            <g:if test="${flash.message}">
                <div class="message alert alert-success text-center text-white" role="status">${flash.message}</div>
            </g:if>

            <div class="card w-100 col-sm-11 mx-auto p-0 overflow-hidden mb-3" style="width: 18rem;">
                <div class="card-header">
                    Informations détaillées
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item d-flex justify-content-between">
                        <span class="text-gray-700"> Nom d'utilisateur : </span>
                        <span class="text-dark font-weight-bold">${user.username}</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <span class="text-gray-700"> Les annonces : </span>
                        <div>
                            <ul>
                                <g:each in="${user.annonces}" var="${annonce}">
                                    <li>
                                        <a href="/annonce/show/${annonce.id}">
                                        ${annonce.title}
                                        </a>
                                    </li>
                                </g:each>
                            </ul>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <span class="text-gray-700"> Rôle : </span>
                        <span class="text-dark font-weight-bold">${user.getAuthoritiesForHTMLRender()}</span>
                    </li>
                </ul>
            </div>
            <g:form resource="${this.user}" method="DELETE" class="justify-content-center d-flex col-sm-11">
                <fieldset class="buttons w-100 d-flex justify-content-around">
                    <g:link class="edit btn btn-success shadow-sm" action="edit" resource="${this.user}">
                        <g:message code="default.button.edit.label" default="Edit" />
                    </g:link>
                    <input class="delete btn btn-danger shadow-sm" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
