package lecoincoin

import lecoincoin.Annonce

class BootStrap {

    def init = { servletContext ->

        def roleAdmin = new Role(authority: 'ROLE_ADMIN').save()
        def roleModerator = new Role(authority: 'ROLE_MODERATOR').save()
        def roleCustomer = new Role(authority: 'ROLE_CUSTOMER').save()

        def adminUser = new User(username: "admin", password: "admin").save()
        def moderatorUser = new User(username: "moderator", password: "moderator").save()

        UserRole.create(adminUser, roleAdmin, true)
        UserRole.create(moderatorUser, roleModerator, true)

        ["customer1","customer2"].each { // create users
            String uName ->
                def userInstance = new User(username: uName, password: uName)
                (1..8).each { // create annonces
                    Integer aIndex ->
                        def annonceInstance = new Annonce(
                                title: "Titre annonce $aIndex de $uName",
                                description: "Description annonce $aIndex de $uName",
                                price: 100 * aIndex,
                                isActive: aIndex%2 == 0 ? true: false)
                        (1..2).each {// create illutations belong to annonce
                            annonceInstance.addToIllustrations(new Illustration(filename: "../annonce-test.jpg"))
                        }
                        userInstance.addToAnnonces(annonceInstance)
                }
                userInstance.save(flush: true, failOnError: true)
                UserRole.create(userInstance, roleCustomer)
        }

    }

    def destroy = {
    }
}
