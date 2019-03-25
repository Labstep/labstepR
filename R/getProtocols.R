#' Get Protocols
#'
#' This function allows you to search your Protocol library on Labstep.
#' @name getProtocols
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param count Number of results to return. Defaults to 100.
#' @return Returns a list of `protocol` objects
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' protocols <- getProtocols(user)
#' print(protocols)

getProtocols <- function(user,count=100){

  url = paste('https://api.labstep.com/api/generic/protocol-collection?search=1&protocol_collection_playlist_id=',
              user$protocol_collection_playlists[[1]]$id,
              '&cursor=-1','&count=',min(count,1000),
              sep='')
  req <- httr::GET(url,
              add_headers(apikey=user$api_key),
              encode='json')

  resp = content(req)
  items = resp$items

  expected_results = min(resp$total,count)

  while(length(items)<expected_results){

    url = paste('https://api.labstep.com/api/generic/protocol-collection?search=1&protocol_collection_playlist_id=',
                user$protocol_collection_playlists[[1]]$id,
                '&cursor=',resp$next_cursor,'&count=',min(expected_results-length(items),1000),
                sep='')
    req <- httr::GET(url,
               add_headers(apikey=user$api_key),
               encode='json')

    resp = content(req)
    items = c(items,resp$items)
  }


  return(items)
}
