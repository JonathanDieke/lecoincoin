package lecoincoin

import grails.gorm.services.Service

@Service(Annonce)
interface AnnonceService /*implements MyAnnonceService*/ {

    Annonce get(Serializable id)

    List<Annonce> list(Map args)

    Long count()

    void delete(Serializable id)

    Annonce save(Annonce annonce)

}