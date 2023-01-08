package lecoincoin

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class AnnonceController {

    AnnonceService annonceService
    UserService userService
    def fileUploaderService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)

        def currentUser = springSecurityService.currentUser
        if (currentUser.getAuthorities()[0].authority == "ROLE_CUSTOMER") {
            render view: "index", model: [annonceList: currentUser.annonces.sort { it.dateCreated }, annonceCount: currentUser.annonces.size()]
        } else {
            respond annonceService.list(params), model: [annonceCount: annonceService.count()]
        }
    }

    def show(Long id) {
        respond annonceService.get(id)
    }

    def create() {
        respond new Annonce(params), model: [userList: userService.list()]
    }

    def save(Annonce annonce) {

        if (annonce == null) {
            notFound()
            return
        }

        try {
            //save annonce
            if (params.author == null) {
                annonce.author = springSecurityService.currentUser
            }
            annonce.isActive = params.status == "on" ? Boolean.TRUE : Boolean.FALSE
            annonce = annonceService.save(annonce)

            // get files for illustrations
            request.getFiles('files[]').each{ file ->
                fileUploaderService.uploadFile(file, annonce)
            }
        } catch (ValidationException e) {
            respond annonce.errors, view: 'create', model: [userList: userService.list()]
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond annonceService.get(id), model: [userList: userService.list()]
    }

    def update(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            if (params.author == null) {
                annonce.author = springSecurityService.currentUser
            }
            annonce.isActive = params.status == "on" ? Boolean.TRUE : Boolean.FALSE
            annonce = annonceService.save(annonce)

            // get files for illustrations
//            println request.getPart('files[]')
//            request.getPart('files[]').each{ file ->
//                fileUploaderService.uploadFile(file, annonce)
//            }

        } catch (ValidationException e) {
            respond annonce.errors, view: 'edit', model: [userList: userService.list()]
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    private Boolean validateFileIllustration(file) {
        if (file.size > 5120000) {
            flash.message = "La taille des images ne doit pas dépasser 5 Mo"
            redirect(uri: request.getHeader("referer"))
            return Boolean.FALSE
        }
        if (!file.contentType.startsWith("image/")) {
            flash.message = "Seuls les fichiers d'images sont acceptés"
            redirect(uri: request.getHeader("referer"))
            return Boolean.FALSE
        }

        return Boolean.TRUE
    }
}
