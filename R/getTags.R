#' Retrieve a list of user tags.
#'
#' This function allows you to retrieve a list of the users tags.
#' @name getTags
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param name Optionally specify the name of tags to retrieve.
#' @param count Max number of results to return. Defaults to 100.
#' @return Returns a list of tags with matching names.
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' tags <- getTags(user)
#' print(tags)

getTags <- function(user,name=NULL,count=100){

  url = 'https://api.labstep.com/api/generic/tag'

  params = list(search=1,cursor=-1,count=min(count,100))

  if(!is.null(name)){
    params$search_query = name
  }

  req <- httr::GET(url,query=params,
                   add_headers(apikey=user$api_key),
                   encode='json')

  resp = content(req)
  items = resp$items

  expected_results = min(resp$total,count)

  while(length(items)<expected_results){

    params$cursor = resp$next_cursor
    params$count = min(expected_results-length(items))

    req <- httr::GET(url,query=params,
                     add_headers(apikey=user$api_key),
                     encode='json')

    resp = content(req)
    items = c(items,resp$items)
  }

  return(items)
}
