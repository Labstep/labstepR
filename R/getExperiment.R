#' Get Experiment
#'
#' This function allows you to retrieve metadata for a single experiment
#' @name getExperiment
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param id ID of the experiment to retrieve
#' @return Returns an `experiment` object
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' experiment <- getExperiment(user,123)
#' print(experiments)


library(httr)

getExperiment <- function(user,id){

  url = paste('https://api.labstep.com/api/generic/experiment-workflow/',id,
              sep='')
  req <- GET(url,
             add_headers(apikey=user$api_key),
             encode='json')

  resp = content(req)

  return(resp)
}
