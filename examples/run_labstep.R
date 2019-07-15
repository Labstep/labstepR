# Installation of R package
install.packages("devtools")
library(devtools)
install_github("Labstep/labstepR")
library(labstepR)

# Type ??labstepR to show help pages for functions

# Login to your account
user <- login("your account name","your Password") 

# Create an experiment
experiment <- createExperiment(user,"My R Script Experiment","This is a description of my test experiment") 

# Perform data analysis and output files
data <- mtcars
df <- table(mtcars$cyl, mtcars$gear)

jpeg("sample_figure.jpg", width=500, height=500)
barplot(df, main="Sample Figure",col=c("darkgrey", "cadetblue", "dodgerblue4"), legend=rownames(df), ylim=c(0, 16))
dev.off()

save(data, file="sample_file.RData")
write.csv(data, file="sample_sheet.csv")
# Attach a file to an experiment
filepath <- "sample_figure.jpg"
filepath2 <- "sample_file.RData"
filepath3 <- "sample_sheet.csv"

file <- attachFile(user, experiment, filepath, "Your Figure")
file2 <- attachFile(user, experiment, filepath2, "Your Data File")
file3 <- attachFile(user, experiment, filepath3, "You CSV File")

# Comment on an experiment
comment <- addComment(user,experiment,"This is a test.")

