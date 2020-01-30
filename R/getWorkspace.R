#' Retrieve metadata for a particular Labstep Workspace
#'
#' This function allows you to retrieve metadata for a single workspace
#' @name getWorkspace
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param id ID of the workspace to retrieve
#' @return Returns a `workspace` object
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' workspace <- getWorkspace(user,1186)
#' print(workspace)

getWorkspace <- function(user,id){

  url = paste('https://api.labstep.com/api/generic/group/',id,
              sep='')
  req <- httr::GET(url,
             add_headers(apikey=user$api_key),
             encode='json')

  resp = content(req)

  return(resp)
}
