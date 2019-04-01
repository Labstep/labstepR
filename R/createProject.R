#' Create a Project on Labstep
#'
#' This function allows you to create a Labstep Project.
#' @name createProject
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param name The name you want to give your Project.
#' @return Returns an `project` object
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' project <- createProject(user,'My First Project')
#' print(project)

createProject <- function(user,name){

  req <- httr::POST('https://api.labstep.com/api/generic/group',
              body=list(name=name),
              add_headers(apikey=user$api_key),
              encode='json')

  return(content(req))
}
