<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="my-layout"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<div class="container-fluid mb-4">
    <h1 class="text-dark">
        <g:message code="default.edit.label" args="[entityName]"/>
    </h1>
</div>


<div id="edit-annonce" class="content scaffold-edit container-fluid " role="main">

    <g:if test="${flash.message}">
        <div class="message alert alert-success" role="status">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${this.annonce}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                    <g:message error="${error}"/>
                </li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form resource="${this.annonce}" method="PUT" class="form container-fluid" enctype="multipart/form-data">
        <g:hiddenField name="version" value="${this.annonce?.version}"/>

        <div class="form-group row">
            <label class="text-dark col-sm-2" for="title">Titre
                <span class='required-indicator'>*</span>
            </label>

            <div class="col-sm-10 col-lg-8">
                <input type="text" class="form-control" id="title" name="title" value="${this.annonce.title}">
            </div>
        </div>

        <div class="form-group row">
            <label class="text-dark col-sm-2" for="description">Description
                <span class='required-indicator'>*</span>
            </label>

            <div class="col-sm-10 col-lg-8">
                <g:textArea name="description" class="form-control" value="${this.annonce.description}"></g:textArea>
            </div>
        </div>

        <div class="form-group row">
            <label class="text-dark col-sm-2" for="price">Prix
                <span class='required-indicator'>*</span>
            </label>

            <div class="col-sm-10 col-lg-8">
                <input type="number" min="0" step="0.01" class="form-control" id="price" name="price"
                       value="${this.annonce.price}">
            </div>
        </div>

        <sec:ifAnyGranted roles="ROLE_MODERATOR, ROLE_ADMIN">
            <div class="form-group row">
                <label class="text-dark col-sm-2" for="author">Autheur
                    <span class='required-indicator'>*</span>
                </label>

                <div class="col-sm-10 col-lg-8">
                    <select class="custom-select mb-3" multiple size="3" name="author" id="author">
                        <option>Choisir un autheur</option>
                        <g:each in="${userList}" var="user">
                            <g:if test="${user.id == this.annonce.author.id}">
                                <option selected value="${user.id}">${user.username}</option>
                            </g:if>
                            <g:else>
                                <option value="${user.id}">${user.username}</option>
                            </g:else>
                        </g:each>
                    </select>
                </div>
            </div>
        </sec:ifAnyGranted>

%{--        <div class="form-group row">--}%
%{--            <label class="text-dark col-sm-2" for="price">Illustrations--}%
%{--                <span class='required-indicator'>*</span>--}%
%{--            </label>--}%
%{--            <div class="col-sm-10 col-lg-8 custom-file px-5">--}%
%{--                <input type="file" class="custom-file-input" id="file" name="files[]">--}%
%{--                <label class="custom-file-label" for="file">Ajouter des images</label>--}%
%{--            </div>--}%
%{--        </div>--}%


        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="status" name="status" <g:if
                            test="${this.annonce.isActive}">checked</g:if>>
                    <label class="form-check-label" for="status">
                        Annonce active
                    </label>
                </div>
            </div>
        </div>

        <fieldset class="buttons">
            <g:submitButton name="edit"
                            class="save btn btn-success shadow-lg"
                            value="${message(code: 'default.button.edit.label', default: 'Editer')}"/>
        </fieldset>
    </g:form>

</div>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script>
%{--    show image name in illustration inupt file --}%
    $('.custom-file input').change(function (e) {
        var files = [];
        for (var i = 0; i < $(this)[0].files.length; i++) {
            files.push($(this)[0].files[i].name);
        }
        $(this).next('.custom-file-label').html(files.join(', '));
    });

</script>
</body>
</html>
