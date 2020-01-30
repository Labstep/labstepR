#' Create a Workspace on Labstep
#'
#' This function allows you to create a Labstep Workspace.
#' @name createWorkspace
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param name The name you want to give your Workspace.
#' @return Returns an `workspace` object
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' workspace <- createWorkspace(user,'My First Workspace')
#' print(workspace)

createWorkspace <- function(user,name){

  req <- httr::POST('https://api.labstep.com/api/generic/group',
              body=list(name=name),
              add_headers(apikey=user$api_key),
              encode='json')

  return(content(req))
}
