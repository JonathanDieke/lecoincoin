<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="my-layout" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <!-- Page Heading -->
        <div class="container-fluid d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="mb-3 text-dark">
                <g:message code="default.list.label" args="[entityName]"/>
            </h1>
            <g:link class="create d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="create">
                <i class="fas fa-plus fa-sm text-white-50"></i>
                <g:message code="default.new.label" args="[entityName]" />
            </g:link>
        </div>
        <!-- End Page Heading -->

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div class="pagination container-fluid mb-3">
            <g:paginate total="${annonceCount ?: 0}" max="5" />
        </div>

        <div class="container-fluid">
            <div class="col-120 table-responsive">
                <table class="table table-bordered h-100">
                    <thead>
                        <tr>
                            <th scope="col">Titre</th>
                            <th scope="col">Description</th>
                            <th scope="col">Prix</th>
                            <th scope="col">Statut</th>
                            <th scope="col">Nb. d'illustrations</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${annonceList}" var="annonce">
                        <tr class="h-100">
                            <th scope="row">${annonce.title.toUpperCase()}</th>
                            <td>${annonce.getTruncateDescription(20)}</td>
                            <td>${annonce.price}</td>
                            <td>${annonce.status}</td>
                            <td>${annonce.illustrations.size()}</td>
                            <td class="d-sm-flex justify-content-around h-100">
                                <a href="/annonce/show/${annonce.id}" class="btn btn-primary"><i class="far fa-eye "></i></a>
                                <a href="/annonce/edit/${annonce.id}" class="btn btn-success"><i class="fas fa-edit"></i></a>
                                <a type="button" class="btn btn-danger" onclick="confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}') ? document.querySelector('.form-delete-annonce-${annonce.id}').submit() : null"><i class="far fa-trash-alt"></i></a>
                            </td>
                            <g:form resource="${annonce}" method="DELETE" class="form-delete-annonce-${annonce.id}">
                            </g:form>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>