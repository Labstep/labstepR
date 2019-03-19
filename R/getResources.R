#' Get Resources
#'
#' This function allows you to search your Resource library on Labstep.
#' @name getResources
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `authenticate` command
#' @return Returns a list of `resource` objects
#' @export
#' @examples
#' user <- authenticate("demo@labstep.com","demopassword")
#' resources <- getResources(user)
#' print(resources)


library(httr)

getResources <- function(user){

  url = paste('https://api.labstep.com/api/generic/resource?search=1&resource_list_id=',
              user$resource_lists[[1]]$id,
              '&cursor=-1','&count=1000',
              sep='')
  req <- GET(url,
             add_headers(apikey=user$api_key),
             encode='json')

  return(content(req)$items)
}
