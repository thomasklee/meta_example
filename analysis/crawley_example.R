# ------------
# Meta-analysis example from Crawley's 'The R Book', p. 742
# ------------

# load libraries needed
library(meta)

# import data
data <- read.csv("data/crawley_data_p742.csv")

# run stats
metacont(data$nT, data$meanT, data$sdT, data$nC, data$meanC, data$sdC)

# create forest plot
forest(metacont(data$nT, data$meanT, data$sdT, data$nC, data$meanC, data$sdC))
