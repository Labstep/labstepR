#' Get Experiments
#'
#' This function allows you to search your Experiments on Labstep.
#' @name getExperiments
#' @param user A labstep user object. Must contain an `api\_key` field. Returned from `login` command
#' @param count Number of results to return. Defaults to 100.
#' @return Returns a list of `experiment` objects
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' experiments <- getExperiments(user)
#' print(experiments)

getExperiments <- function(user,count=100){

  url = paste('https://api.labstep.com/api/generic/experiment-workflow?search=1',
              '&cursor=-1','&count=',min(count,1000),
              sep='')
  req <- httr::GET(url,
             add_headers(apikey=user$api_key),
             encode='json')

  resp = content(req)
  items = resp$items

  expected_results = min(resp$total,count)

  while(length(items)<expected_results){

    url = paste('https://api.labstep.com/api/generic/experiment-workflow?search=1',
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
