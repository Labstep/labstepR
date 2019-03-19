#' Create a Resource on Labstep
#'
#' This function allows you to create a resource on Labstep.
#' @name createResource
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `authenticate` command.
#' @param name The name you want to give your resource
#' @return Returns a `resource` object
#' @export
#' @examples
#' user <- authenticate("demo@labstep.com","demopassword")
#' resource <- createResource(user,'My First Resource')
#' print(resource)


library(httr)

createResource <- function(user,name,metadata){

  req <- POST('https://api.labstep.com/api/generic/resource',
              body=list(name=name),
              add_headers(apikey=user$api_key),
              encode='json')

  return(content(req))
}
