# labstepR

An R package for working with the Labstep API in R.

## Installation

In R:

```
install.packages("devtools")
library(devtools)
install_github("Labstep/labstepR")
```

## Usage

```
# Login to your Labstep account
user <- login('YOUR_USERNAME','YOUR_PASSWORD') 

# Create an experiment
experiment <- createExperiment(user,'My First Experiment','This is a description of my test experiment') 

# Comment on an experiment
comment <- addComment(user,experiment,'This is me commenting on my test experiment')

# Attach a file to an experiment

filepath = 'test_file.txt'

file <- attachFile(user,experiment,filepath,'does this caption work?')


