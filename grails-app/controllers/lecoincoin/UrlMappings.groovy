package lecoincoin

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "login", action: "index")
//        "/login/auth"(view : "00auth")
        name home : "/home"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
