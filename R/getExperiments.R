#' Get Experiments
#'
#' This function allows you to search your Protocol library on Labstep.
#' @name getExperiments
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `authenticate` command
#' @return Returns a list of `experiment` objects
#' @export
#' @examples
#' user <- authenticate("demo@labstep.com","demopassword")
#' experiments <- getExperiments(user)
#' print(experiments)


library(httr)

getExperiments <- function(user){

  url = paste('https://api.labstep.com/api/generic/experiment-workflow?search=1',
              '&cursor=-1','&count=1000',
              sep='')
  req <- GET(url,
             add_headers(apikey=user$api_key),
             encode='json')

  return(content(req)$items)
}
