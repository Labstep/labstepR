library(httr)


createResource <- function(user,name,metadata){
  
  req <- POST('https://api.labstep.com/api/generic/resource',
              body=list(name=name),
              add_headers(apikey=user$api_key),
              encode='json')
  
  return(content(req))
}
