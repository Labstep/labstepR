#' Get Resource
#'
#' This function allows you to retrieve metadata for a single resource
#' @name getResource
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `authenticate` command
#' @param id ID of the resource to retrieve
#' @return Returns a `resource` object
#' @export
#' @examples
#' user <- authenticate("demo@labstep.com","demopassword")
#' resource <- getResource(user,123)
#' print(resource)


library(httr)

getResource <- function(user,id){

  url = paste('https://api.labstep.com/api/generic/resource/',id,
              sep='')
  req <- GET(url,
             add_headers(apikey=user$api_key),
             encode='json')

  resp = content(req)

  return(resp)
}
