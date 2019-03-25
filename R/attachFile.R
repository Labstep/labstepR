#' Attaches a file to a thread on Labstep
#'
#' This function allows you to attach a file to different content types 
#' @name attachFile
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param object The labstep object you want to comment on. Can be `protocol`, `experiment` or `resource`
#' @param filepath The path to ther file to attach.
#' @param caption A caption describing your file (optional)
#' @return Returns a `comment` object with the file attached
#' @import httr
#' @export
#' @examples
#' user <- login("demo","demopassword")
#' experiment <- createExperiment(user,'My First Experiment','An experiment testing the labstepR library')
#' file <- attachFile(user,experiment,'An experiment testing the labstepR library')
#' print(file)


attachFile <- function(user,object,filepath,caption){
  
  req1 <- httr::POST('https://api.labstep.com/api/generic/file/upload',
              body=list(file=upload_file(filepath)),
              add_headers(apikey=user$api_key),
              encode='multipart')
  
  file = content(req1) 
  
  req <- httr::POST('https://api.labstep.com/api/generic/comment',
              body=list(body=caption,file_id=list(names(file)[1]),thread_id=object$thread$id),
              add_headers(apikey=user$api_key),
              encode='json')
  
  return(content(req))
}