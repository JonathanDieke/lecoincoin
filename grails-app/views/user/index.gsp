<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="my-layout" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>

    <heading>
        test heading
    </heading>

    <body>
%{--        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--        <div class="nav" role="navigation">--}%
%{--            <ul>--}%
%{--                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--            </ul>--}%
%{--        </div>--}%
%{--        <div id="list-user" class="content scaffold-list" role="main">--}%
%{--            <h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
%{--            <g:if test="${flash.message}">--}%
%{--                <div class="message" role="status">${flash.message}</div>--}%
%{--            </g:if>--}%
%{--            <f:table collection="${userList}" />--}%

%{--            <div class="pagination">--}%
%{--                <g:paginate total="${userCount ?: 0}" />--}%
%{--            </div>--}%
%{--        </div>--}%

        <!-- Page Heading -->
%{--        <div class="container-fluid mb-4 d-sm-flex align-items-center justify-content-between ">--}%
%{--            <h1 class="mb-0 text-dark">--}%
%{--                <g:message code="default.list.label" args="[entityName]"/>--}%
%{--            </h1>--}%
%{--        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i--}%
%{--                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a--}%
%{--        </div>--}%

        <div class="container-fluid d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-3 text-dark">
                <g:message code="default.list.label" args="[entityName]"/>
            </h1>
            <g:link class="create d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" action="create">
                <i class="fas fa-plus fa-sm text-white-50"></i>
                <g:message code="default.new.label" args="[entityName]" />
            </g:link>
        </div>
        <!-- End Page Heading -->

        <div class="pagination">
            <g:paginate total="${userCount ?: 0}" />
        </div>

        <div class="container-fluid">
%{--            <div class="row">--}%
                <div class="col-120 table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Nom d'utilisateur</th>
                            <th scope="col">Mot de passe</th>
                            <th scope="col">Roles</th>
                            <th scope="col">Nombre d'annonces</th>
                            <th scope="col">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <g:each in="${userList}" var="user">
                                <tr>
                                    <th scope="row">${user.username.toUpperCase()}</th>
                                    <td>${user.getPartialPassword()}...</td>
                                    <td>${user.getAuthoritiesForHTMLRender()}</td>
                                    <td>${user.annonces.size()}</td>
                                    <td class="d-sm-flex justify-content-between">
                                        <button type="button" class="btn btn-primary"><i class="far fa-eye"></i></button>
                                        <button type="button" class="btn btn-success"><i class="fas fa-edit"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
%{--            </div>--}%
        </div>
    </body>
</html>