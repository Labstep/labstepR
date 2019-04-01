## Example Script

user <- login('YOUR_USERNAME','YOUR_PASSWORD')
print(user)
experiment <- createExperiment(user,'R Package Test','R package description')
print(experiment)
comment <- addComment(user,experiment,'Test Comment')
print(comment)
script = rstudioapi::getSourceEditorContext()$path
file <- attachFile(user,experiment,script,'does this caption work?')
print(file)
resource <- createResource(user,'R Package Test Resource')
print(resource)
