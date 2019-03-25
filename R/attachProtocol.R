#' Attach a Protocol to an Experiment on Labstep
#'
#' This function allows you to attach a Protocol to an existing Experiment.
#' @name attachProtocol
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param experiment The experiment you want to attach the protocol to. Must have at least an `id` field.
#' @param protocol The protocol you want to attach. Must have at least an `id` field
#' @return Returns an `experiment` object
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' experiment <- createExperiment(user,'My First Experiment','An experiment testing the labstepR library')
#' protocol <- createProtocol(user,'My First Protocol')
#' experiment <- attachProtocol(user,experiment,protocol)
#' print(experiment)

attachProtocol <- function(user,experiment,protocol){

  req <- httr::POST('https://api.labstep.com/api/generic/experiment',
              body=list(experiment_workflow_id=experiment$id,protocol_id=protocol$id),
              add_headers(apikey=user$api_key),
              encode='json')

  url = paste('https://api.labstep.com/api/generic/experiment-workflow/',experiment$id,sep='')
  req <- httr::GET(url,
             add_headers(apikey=user$api_key),
             encode='json')
  experiment = content(req)

  return(experiment)
}
