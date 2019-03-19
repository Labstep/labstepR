#' Get Protocols
#'
#' This function allows you to search your Protocol library on Labstep.
#' @name getProtocols
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `authenticate` command
#' @return Returns a list of `protocol` objects
#' @export
#' @examples
#' user <- authenticate("demo@labstep.com","demopassword")
#' protocols <- getProtocols(user)
#' print(protocols)


library(httr)

getProtocols <- function(user){

  url = paste('https://api.labstep.com/api/generic/protocol-collection?search=1&protocol_collection_playlist_id=',
              user$protocol_collection_playlists[[1]]$id,
              '&cursor=-1','&count=1000',
              sep='')
  req <- GET(url,
              add_headers(apikey=user$api_key),
              encode='json')

  return(content(req)$items)
}
