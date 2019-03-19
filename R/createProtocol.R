#' Create a Protocol on Labstep
#'
#' This function allows you to create a protocol.
#' @name createProtocol
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `authenticate` command
#' @param name The name you want to give your protocol.
#' @return Returns an `protocol` object
#' @export
#' @examples
#' user <- authenticate("demo@labstep.com","demopassword")
#' protocol <- createProtocol(user,'My First Protocol')
#' print(protocol)


library(httr)

createProtocol <- function(user,name){

  req <- POST('https://api.labstep.com/api/generic/protocol',
              body=list(name=name),
              add_headers(apikey=user$api_key),
              encode='json')

  return(content(req))
}
