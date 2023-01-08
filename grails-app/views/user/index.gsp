<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="my-layout" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
            <div class="container-fluid">
                <div class="message  alert alert-success text-center" role="status">${flash.message}</div>
            </div>
        </g:if>

        <div class="container-fluid mb-3 pagination">
            <g:paginate total="${userCount ?: 0}" max="3" />
        </div>

        <div class="container-fluid">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr >
                            <th scope="col">Nom d'utilisateur</th>
                            <th scope="col">Nombre d'annonces</th>
                            <th scope="col">Role</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${userList}" var="user">
                            <tr>
                                <th scope="row">${user.username.toUpperCase()}</th>
                                <td>${user.annonces.size()}</td>
                                <td>${user.getAuthoritiesForHTMLRender()}</td>
                                <td class="d-flex justify-content-around">
                                    <a href="/user/show/${user.id}" class="btn btn-primary"><i class="far fa-eye"></i></a>
                                    <a href="/user/edit/${user.id}" class="btn btn-success"><i class="fas fa-edit"></i></a>
                                    <a type="button" class="btn btn-danger" onclick="confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}') ? document.querySelector('.form-delete-user-${user.id}').submit() : null"><i class="far fa-trash-alt"></i></a>
                                </td>
                                <g:form resource="${user}" method="DELETE" class="form-delete-user-${user.id}">
                                </g:form>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>