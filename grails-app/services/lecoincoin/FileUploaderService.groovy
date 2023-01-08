package lecoincoin

import grails.gorm.transactions.Transactional

@Transactional
class FileUploaderService {

    def springSecurityService

    def uploadFile(file, Annonce annonce) {
        if (!file.empty) {
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
