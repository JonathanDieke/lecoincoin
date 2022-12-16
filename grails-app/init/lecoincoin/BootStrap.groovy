package lecoincoin

class BootStrap {

    def init = { servletContext ->
        def roleAdmin = new Role(authority: 'ROLE_ADMIN').save()
        def roleModerator = new Role(authority: 'ROLE_MODERATOR').save()
        def roleCustomer = new Role(authority: 'ROLE_CUSTOMER').save()
        def adminUser = new User(username: "jd", password: "12345678").save()
        UserRole.create(adminUser, roleAdmin, true)
    }

    def destroy = {
    }
}
