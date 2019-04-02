#' Create a new tag on Labstep
#'
#' This function allows you to create a tag.
#' @name createTag
#' @param user A labstep user object. Must contain an `api_key` field. Returned from `login` command
#' @param name The name of the tag.
#' @return Returns an `tag` object
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' tag <- createTag(user,'MyTag')
#' print(tag)

createTag <- function(user,name){

  req <- httr::POST('https://api.labstep.com/api/generic/tag',
                    body=list(name=name),
                    add_headers(apikey=user$api_key),
                    encode='json')

  return(content(req))
}
