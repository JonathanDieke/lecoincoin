package lecoincoin

class Annonce {

    String title
    String description
    Float price
    Boolean isActive = Boolean.FALSE
    Date dateCreated
    Date lastUpdated
    List illustrations

    static constraints = {
        title blank: false, maxSize: 50, minSize: 3, nullable: false
        description blank: false, nullable: false
        price min: 0F, nullable: false, scale: 2
        isActive nullable: false
    }

    def getStatus(){
        return this.isActive ? "Actif" : "Non-actif"
    }

//    def setIsActive(String status){
//        this.isActive = status == "on" ? Boolean.TRUE : Boolean.FALSE
//        println this.isActive.toString() + "my status"
//    }

    def getTruncateDescription(int maxLength){
        return this.description.length() <= maxLength ? this.description : this.description.take(maxLength) + "..."
    }

    static mapping = {
        description type: 'text'
    }

    static hasMany = [illustrations: Illustration]

    static belongsTo = [author: User]
}
