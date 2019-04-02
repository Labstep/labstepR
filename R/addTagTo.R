#' Attach an existing tag to an entity on Labstep. See 'tag' for a simplified tagging function.
#'
#' This function allows you to attach a tag to a Labstep entity (Protocol, Resource or Experiment).
#' @name addTagTo
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param entity The Labstep entity to tag. Can be a Resource, Experiment or Protocol.
#' @param tag A tag entity. Must have an 'id' field.
#' @return Returns the tagged entity.
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' tags <- getTags(user,count=1)
#' tag = tags[[1]]
#' experiments <- getExperiments(user,count=1)
#' experiment = experiments[[1]]
#' experiment = addTagTo(user,experiment,tag)

addTagTo <- function(user,entity,tag){

  if('experiments' %in% names(entity)){
    entityType ='experiment-workflow'
  } else if('parent_protocol' %in% names(entity)){
    entityType ='protocol-collection'
  } else if('resource_location' %in% names(entity)){
    entityType = 'resource'
  } else if('collection' %in% names(entity)){
    entityType ='protocol-collection'
    entity = entity$collection
  } else {
    stop('Entities of this type cannot be tagged')
  }

  url = paste('https://api.labstep.com/api/generic/',entityType,'/',entity['id'],'/tag/',tag['id'],sep = '')

  req <- httr::PUT(url,
                   add_headers(apikey=user$api_key),
                   encode='json')

  resp = content(req)
  return(resp)
}
