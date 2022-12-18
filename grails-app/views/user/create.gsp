<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="my-layout"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

    <body>

        <div class="container-fluid d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="mb-3 text-dark">
                <g:message code="default.create.label" args="[entityName]"/>
            </h1>
        </div>

        <div id="create-user" class="content scaffold-create" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.user}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form resource="${this.user}" method="POST" class="form container-fluid">
                <div class="form-group row">
                    <label class="text-dark col-sm-2" for="username">Nom d'utilisateur
                        <span class='required-indicator '>*</span>
                    </label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="text-dark col-sm-2" for="password">Mot de passe
                        <span class='required-indicator'>*</span>
                    </label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="text-dark col-sm-2" for="role">Role
                        <span class='required-indicator'>*</span>
                    </label>
                    <div class="col-sm-8">
                        <select class="custom-select mb-0" name="role" id="role" required>
                            <option selected>Attribuer un rôle</option>
                            <g:each in="${roleList}" var="role">
                                <option value="${role.id}">${role.authority}</option>
                            </g:each>
                        </select>
                    </div>
                </div>

                <fieldset class="buttons">
                    <g:submitButton name="create"
                                    class="save btn btn-primary shadow-lg"
                                    value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
