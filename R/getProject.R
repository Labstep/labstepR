#' Get Project
#'
#' This function allows you to retrieve metadata for a single project
#' @name getProject
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `authenticate` command
#' @param id ID of the project to retrieve
#' @return Returns a `project` object
#' @export
#' @examples
#' user <- authenticate("demo@labstep.com","demopassword")
#' project <- getProject(user,123)
#' print(project)


library(httr)

getProject <- function(user,id){

  url = paste('https://api.labstep.com/api/generic/group/',id,
              sep='')
  req <- GET(url,
             add_headers(apikey=user$api_key),
             encode='json')

  resp = content(req)

  return(resp)
}
