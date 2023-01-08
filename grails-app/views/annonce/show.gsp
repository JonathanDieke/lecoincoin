<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="my-layout"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="container-fluid mb-4">
    <h1 class="mb-3 text-dark">
        <g:message code="default.show.label" args="[entityName]"/>
    </h1>
</div>

<div id="show-annonce" class="content scaffold-show container-fluid" role="main">

    <g:if test="${flash.message}">
        <div class="message alert alert-success" role="status">${flash.message}</div>
    </g:if>

    <div class="card w-100 col-sm-12 mx-auto p-0 overflow-hidden mb-3" style="width: 18rem;">
        <div class="card-header">
            Informations détaillées
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex justify-content-between">
                <span class="text-gray-700">Title :</span>
                <span class="text-dark font-weight-bold">${annonce.title}</span>
            </li>
            <li class="list-group-item d-flex justify-content-between">
                <span class="text-gray-700">Description :</span>
                <span class="text-dark font-weight-bold">${annonce.description}</span>
            </li>
            <li class="list-group-item d-flex justify-content-between">
                <span class="text-gray-700">Prix</span>
                <span class="text-dark font-weight-bold">${annonce.price}</span>
            </li>
            <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                <li class="list-group-item d-flex justify-content-between">
                    <span class="text-gray-700">Autheur</span>
                    <a class="font-weight-bold" href="/user/show/${annonce.author.id}">${annonce.author.username}</a>
                </li>
            </sec:ifAnyGranted>
            <li class="list-group-item d-flex justify-content-between">
                <span class="text-gray-700">Illustrations</span>
                <div>
                    <g:if test="${annonce.illustrations.size() > 0}">
                        <g:each in="${ annonce.illustrations }" var="illustration">
                            <asset:image src="/uploads/${illustration.filename}" width="80" height="80" class="rounded-circle"/>
                        </g:each>
                    </g:if>
                    <g:else>
                        <span class="text-dark font-italic">Aucune illustration</span>
                    </g:else>
                </div>
            </li>
        </ul>
    </div>

    <g:form resource="${this.annonce}" method="DELETE" class="justify-content-start d-flex col-sm-11">
        <fieldset class="buttons w-100 d-flex justify-content-start ">
            <g:link class="edit btn btn-success shadow-sm mr-2 " action="edit" resource="${this.annonce}">
                <g:message code="default.button.edit.label" default="Edit"/>
            </g:link>
            <input class="delete btn btn-danger shadow-sm" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
