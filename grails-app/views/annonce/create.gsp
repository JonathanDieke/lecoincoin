<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="my-layout" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="container-fluid  mb-4">
            <h1 class="mb-3 text-dark">
                <g:message code="default.create.label" args="[entityName]"/>
            </h1>
        </div>

        <div id="create-annonce" class="content scaffold-create">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.annonce}" method="POST" class="form container-fluid">
                <div class="form-group row">
                    <label class="text-dark col-sm-2" for="title">Titre
                        <span class='required-indicator'>*</span>
                    </label>
                    <div class="col-sm-10 col-lg-8">
                        <input type="text" class="form-control" id="title" name="title" >
                    </div>
                </div>

                <div class="form-group row">
                    <label class="text-dark col-sm-2" for="description">Description
                        <span class='required-indicator'>*</span>
                    </label>
                    <div class="col-sm-10 col-lg-8">
                        <g:textArea name="description"  class="form-control"></g:textArea>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="text-dark col-sm-2" for="price">Prix
                        <span class='required-indicator'>*</span>
                    </label>
                    <div class="col-sm-10 col-lg-8">
                        <input type="number" min="0" class="form-control" id="price" name="price" >
                    </div>
                </div>

                <div class="form-group row">
                    <label class="text-dark col-sm-2" for="author">Autheur
                        <span class='required-indicator'>*</span>
                    </label>
                    <div class="col-sm-10 col-lg-8">
                        <select class="custom-select mb-3" multiple size="3" name="author" id="author">
                            <option selected>Choisir un autheur</option>
                            <g:each in="${userList}" var="user">
                                <option value="${user.id}">${user.username}</option>
                            </g:each>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-10 offset-sm-2">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="status" name="status">
                            <label class="form-check-label" for="status">
                                Annonce active
                            </label>
                        </div>
                    </div>
                </div>


                <fieldset class="buttons  ">
%{--                    <g:submitButton name="create" class="save btn btn-primary shadow-lg offset-2 col-sm-10 col-lg-8" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
%{--                    <g:submitButton name="create" class="save btn btn-primary shadow-lg col-2" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
                    <g:submitButton name="create" class="save btn btn-primary shadow-lg offset-5 col-2" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
