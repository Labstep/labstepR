#' Simple tagging of a Labstep entity (creates a new tag if none exists)
#'
#' This function allows you to tag Labstep entities. If the tag exists already it will attach it to the entity, if not a new tag will be created.
#' @name tag
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param entity The Labstep entity to tag. Can be a Resource, Experiment or Protocol.
#' @param name The name of the tag to attach.
#' @return Returns the tagged entity.
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' experiments <- getExperiments(user,count=1)
#' experiment = experiments[[1]]
#' experiment = tag(user,experiment,'My New Tag')

tag <- function(user,entity,name){

  tags = getTags(user,name)

  if(length(tags)>0){
    matchingTags = tags[sapply(tags, function(x) x$name==name)]
    if(length(matchingTags)>0){
      Tag = matchingTags[[1]]
    } else {
      Tag = createTag(user,name)
    }
  } else {
    Tag = createTag(user,name)
  }

  out = addTagTo(user,entity,Tag)
  return(out)
}
