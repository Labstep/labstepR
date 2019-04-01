#' Create a Resource on Labstep
#'
#' This function allows you to create a resource on Labstep.
#' @name createResource
#' @param user A labstep user object. Must contain an `api\_key` field. Returned from `login` command.
#' @param name The name you want to give your resource
#' @return Returns a `resource` object
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' resource <- createResource(user,'My First Resource')
#' print(resource)

createResource <- function(user,name){

  req <- httr::POST('https://api.labstep.com/api/generic/resource',
              body=list(name=name),
              add_headers(apikey=user$api_key),
              encode='json')

  return(content(req))
}
