#' Create an Experiment on Labstep
#'
#' This function allows you to create an experiment card.
#' @name createExperiment
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `authenticate` command
#' @param name The name you want to give your experiment.
#' @param protocolIds List of ids for protocols to attach to the experiment.
#' @param description Give your experiment a description to help you remember what it was about.
#' @return Returns an `experiment` object
#' @export
#' @examples
#' user <- authenticate("demo@labstep.com","demopassword")
#' experiment <- createExperiment(user,'My First Experiment','An experiment testing the labstepR library')
#' print(experiment)


library(httr)

createExperiment <- function(user,name,description=NULL,protocolIds=NULL){

  req <- POST('https://api.labstep.com/api/generic/experiment-workflow',
              body=list(name=name,description=description),
              add_headers(apikey=user$api_key),
              encode='json')

  experiment = content(req)

  if(!is.null(protocolIds)){
    for(id in protocolIds){
      req <- POST('https://api.labstep.com/api/generic/experiment',
                  body=list(experiment_workflow_id=experiment$id,protocol_id=id),
                  add_headers(apikey=user$api_key),
                  encode='json')
    }

    url = paste('https://api.labstep.com/api/generic/experiment-workflow/',experiment$id,sep='')
    req <- GET(url,
                add_headers(apikey=user$api_key),
                encode='json')
    experiment = content(req)

  }

  return(experiment)
}
