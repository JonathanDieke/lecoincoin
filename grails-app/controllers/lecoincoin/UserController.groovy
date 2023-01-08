package lecoincoin

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(["ROLE_ADMIN", "ROLE_MODERATOR"])
class UserController {

    UserService userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)
        respond userService.list(params), model:[userCount: userService.count()]
    }

    def show(Long id) {
        def user = userService.get(id)
        def AdCount = user.getAnnonces().size()
        respond user
    }

    @Secured(["ROLE_ADMIN"])
    def create() {
        def roleList = Role.list()
        respond new User(params), model: [roleList: roleList]
    }

    @Secured(["ROLE_ADMIN"])
    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            def roleToAssociate = Role.get(params.role)
            def newUser = userService.save(user)
            UserRole.create(newUser, roleToAssociate, true)
//            print("customiiiiing", customUserService)
//            customUserService.saveWithRole(user,  params.role)

        } catch (ValidationException e) {
            respond user.errors, view:'create', model: [roleList: roleList]
            return
        }

        request.withFormat {
            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                flash.message = "Utilisateur créé !"
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }
    @Secured(["ROLE_ADMIN"])
    def edit(Long id) {
        def roleList = Role.list()
        respond userService.get(id), model: [roleList: roleList]
    }

    @Secured(["ROLE_ADMIN"])
    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            def userEdited = userService.save(user)
            UserRole.removeAll(userEdited)
            UserRole.create(userEdited, Role.get(params.role), true)
        } catch (ValidationException e) {
            def roleList = Role.list()
            respond user.errors, view:'edit', model: [roleList: roleList]
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = "Utilisateur mis à jour !"
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    @Secured(["ROLE_ADMIN"])
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        def userToDelete = userService.get(id)
        UserRole.removeAll(userToDelete)
        userService.delete(userToDelete.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
