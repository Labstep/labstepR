#' Get Resource
#'
#' This function allows you to retrieve metadata for a single resource
#' @name getResource
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param id ID of the resource to retrieve
#' @return Returns a `resource` object
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' resource <- getResource(user,391521)
#' print(resource)

getResource <- function(user,id){

  url = paste('https://api.labstep.com/api/generic/resource/',id,
              sep='')
  req <- httr::GET(url,
             add_headers(apikey=user$api_key),
             encode='json')

  resp = content(req)

  return(resp)
}
