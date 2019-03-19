#' Adds a comment to a thread on Labstep
#'
#' This function allows you to comment on different content types 
#' @name addComment
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `authenticate` commande
#' @param object The labstep object you want to comment on. Can be `protocol`, `experiment` or `resource`
#' @param body The body of the comment in plain text.
#' @return Returns a `comment` object 
#' @export
#' @examples
#' user <- authenticate("demo","demopassword")
#' experiment <- createExperiment(user,'My First Experiment','An experiment testing the labstepR library')
#' comment <- addComment(user,experiment,'An experiment testing the labstepR library')
#' print(comment)

library(httr)

addComment <- function(user,object,comment){
  
  req <- POST('https://api.labstep.com/api/generic/comment',
              body=list(body=comment,thread_id=object$thread$id),
              add_headers(apikey=user$api_key),
              encode='json')
  
  return(content(req))
}