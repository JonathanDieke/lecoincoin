<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="my-layout" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>

    <div class="container-fluid mb-4">
        <h1 class="text-dark">
            <g:message code="default.edit.label" args="[entityName]"/>
        </h1>
    </div>

    <div id="create-user" class="content scaffold-create container-fluid" role="main">
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="status">*
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${this.user}">
            <div class="alert alert-warning mb-3">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.user}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                            <g:message error="${error}"/>
                        </li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
        <g:form resource="${this.user}" method="PUT" class="form container-fluid">
            <g:hiddenField name="version" value="${this.user?.version}" />

            <div class="form-group row">
                <label class="text-dark col-sm-2" for="username">Nom d'utilisateur
                    <span class='required-indicator '>*</span>
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="text-dark col-sm-2" for="password">Mot de passe
                    <span class='required-indicator'>*</span>
                </label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="password" name="password" required />
                </div>
            </div>

            <div class="form-group row">
                <label class="text-dark col-sm-2" for="role">Role
                    <span class='required-indicator'>*</span>
                </label>
                <div class="col-sm-10">
                    <select class="custom-select mb-0" name="role" id="role" required>
                        <option selected>Attribuer un r??le</option>
                        <g:each in="${roleList}" var="role">
                            <g:if test="${role.id == user.getAuthorities()[0].id}">
                                <option selected value="${role.id}">${role.authority}</option>
                            </g:if>
                            <g:else>
                                <option value="${role.id}">${role.authority}</option>
                            </g:else>
                        </g:each>
                    </select>
                </div>
            </div>

            <fieldset class="buttons">
                <g:submitButton name="edit"
                                class="save btn btn-success shadow-lg"
                                value="${message(code: 'default.button.edit.label', default: 'Editer')}"/>
            </fieldset>
        </g:form>
    </div>
    </body>
</html>
