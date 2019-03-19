#' Create an Experiment on Labstep
#'
#' This function allows you to create an experiment card.
#' @name createExperiment
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` commande
#' @param name The name you want to give your experiment.
#' @param description Give your experiment a description to help you remember what it was about.
#' @return Returns an `experiment` object 
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' experiment <- createExperiment(user,'My First Experiment','An experiment testing the labstepR library')
#' print(experiment)


library(httr)

createExperiment <- function(user,name,description){
  
  req <- POST('https://api.labstep.com/api/generic/experiment-workflow',
              body=list(name=name,description=description),
              add_headers(apikey=user$api_key),
              encode='json')
  
  return(content(req))
}