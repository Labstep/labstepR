#' Authenticate a Labstep user
#'
#' This function allows you to retrieve the user details for your Labstep account. It also returns your unique API key which you need to use the other Labstep API functions.
#' @name login
#' @param username Your Labstep username (usually the email address you signed up with)
#' @param password Your Labstep password
#' @keywords login apikey
#' @return Returns a 'user' object.
#' @import httr
#' @export
#' @examples
#' user <- login("demo@labstep.com","demopassword")
#' print(user)

login <- function(username,password){

  req <- httr::POST('https://api.labstep.com/public-api/user/login',body = list(username=username,password=password))
  return(content(req))
}
