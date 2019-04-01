#' Get Protocol
#'
#' This function allows you to retrieve metadata for a single protocol
#' @name getProtocol
#' @param user A labstep user object. Must contain an `api\_key` field. Returned from `login` command
#' @param id ID of the protocol to retrieve
#' @return Returns a `protocol` object
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' protocol <- getProtocol(user,123)
#' print(protocol)


getProtocol <- function(user,id){

  url = paste('https://api.labstep.com/api/generic/protocol-collection/',id,
              sep='')
  req <- httr::GET(url,
             add_headers(apikey=user$api_key),
             encode='json')

  resp = content(req)

  return(resp)
}
