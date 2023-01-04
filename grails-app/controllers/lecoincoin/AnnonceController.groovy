package lecoincoin

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.SpringSecurityService

class AnnonceController {

    AnnonceService annonceService
    UserService userService
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
            annonce.save(flush: true)

            // get files for illustrations
            request.getFiles('files[]').each{ file ->
                println file.originalFilename

                //validate file : size and format
                if (!validateFileIllustration(file)) {
                    annonce.delete()
                    return
                }

                //now transfer file
                final filename = "user-" + springSecurityService.currentUserId + "-annonce-" + annonce.id + '-' + System.currentTimeMillis() + '-' + file.originalFilename.replace(" ", "_").toLowerCase()
                def pathToDir = new File(System.getProperty("user.dir"))
                File fileDest = new File(pathToDir, "grails-app/assets/images/uploads/${filename}")
                file.transferTo(fileDest)

                // associate to annonce
                annonce.addToIllustrations(new Illustration(filename: filename))
            }

            annonce.save(flush: true)

        } catch (ValidationException e) {
            respond annonce.errors, view: 'create'
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
            def illustrations = request.getFile('illustrations')

            println illustrations

            if (params.author == null) {
                annonce.author = springSecurityService.currentUser
            }
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view: 'edit'
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

    private Boolean validateFileIllustration(files) {
        if (files.size > 5120000) {
            flash.message = "La taille des images ne doit pas dépasser 5 Mo"
            redirect(uri: request.getHeader("referer"))
            return Boolean.FALSE
        }
        if (!files.contentType.startsWith("image/")) {
            flash.message = "Seuls les fichiers d'images sont acceptés"
            redirect(uri: request.getHeader("referer"))
            return Boolean.FALSE
        }

        return Boolean.TRUE
    }
}
