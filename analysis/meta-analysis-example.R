# ---------------------------
# How to do a meta-analysis
# Thomas Klee
# Created: 2018-10-30
# Updated: 2019-04-04
# ---------------------------

# This script illustrates how a meta-analysis can be done.
# The purpose is to demonstrate the use of R and the 'meta' package
# for doing a meta-analysis, forest plot and funnel plot.
# Data from part of figure 3 of Law et al (JSLHR, 47, 924–943, 2004) are used.

# The script contains lines of R code as well as comments describing what the code does.
# This is sometimes called 'literate programming' and the reason for doing this
# is to make your code understandable to others and to your future self.
# Although it takes more time to write a script this way, it saves time later when
# you or someone else is trying to understand what was done.
# Comment lines begin with a hash character. I try to begin my comments
# with an imperative verb to keep them consistent.

# R commands are case-sensitive. 
# In general, I try to avoid using upper case to minimise typing errors.

# R commands are executed by placing the cursor on them and pressing 
# Command-Return on a Mac or Control-Return on a PC.

# you can also run the entire script all at once 
# by clicking on the 'Source' icon at the top of RStudio's script panel.
# if you 'source' the whole file, be sure to look at the output 
# in the Plots tab on the right and click the arrow in that
# to see the graphs you created.

# Let's start:

# load libraries (the only one needed in this script is the 'meta' package)
library(meta)

# display an overview of what the meta package does (a good place to start!)
help(meta)

# use data from Law et al (2004, fig. 3) study, where the
# outcome variable is 'parent report of vocabulary'.
# the data we'll use were stored in a spreadsheet in a folder named 'data' 
# and then saved as a .csv file

# Set your working directory to the 'analysis' folder in the 'More' dropdown 
# menu of RStudio's 'Files' tab.

# import the .csv file into an R object called 'data'.
# replace the name of the CSV file in the line below with the name of your data file
# to run a meta-analysis on your own data.
data <- read.csv("data/law2004_fig3_data.csv")

# notice there is now an object called 'data' in RStudio's Environment tab
# this object is called a dataframe
# click on the word 'data' (not the arrow next to it) and see what happens

# run a meta-analysis based on mean differences (meta's default)
# the summary scores are in the original units each study reported (unstandardised scores)
# calculate effect sizes as Hedges' g (meta's default)
metacont(data$nT, data$meanT, data$sdT, data$nC, data$meanC, data$sdC)

# the output of this command is displayed in the RStudio Console panel

# notice the syntax of the command in line 45: 
## (1) we selected the "metacont" function from the "meta" package.
## (2) we then selected which variables to include and enclosed them in parentheses.
## these were specified using the format "data_frame$variable_name".
## in the example above, "data$nT" tells R we want to include the "nT" variable
## from the "data" data frame that we created in line 37.

# let's run the same command again, but this time we'll save the results  
# to a new object called "stats_md". This object is not a data frame (like 'data')
# but a list object. This isn't particularly important to know at this stage, other than
# to point out that data frames and lists (two kind of objects) are different so 
# different things can be done with them. 

stats_md <- metacont(data$nT, data$meanT, data$sdT, data$nC, data$meanC, data$sdC)

# display results in RStudio's Console
stats_md

# create forest plot and display in RStudio's Plots tab
forest(stats_md)

# if part of the plot is cut off, or if you need a scalable image for documents or slides:
# go to RStudio's Plots tab: Plots > Export > Save as Image > select either PDF or EPS image format

# add study authors and dates
forest(stats_md, studlab = paste(data$author, data$year))

# create funnel plot and display
funnel(stats_md, studlab = paste(data$author, data$year))

# ----------------------
# meta-analyses can be run in other ways using the following commands
# ----------------------

# create forest plot of mean differences using the Cochrane format
forest(stats_md, studlab = paste(data$author, data$year), layout="RevMan5") 

# create it using the J American Medical Assoc format
forest(stats_md, studlab = paste(data$author, data$year), layout="JAMA") 

# run meta-analysis based on standardized mean differences
stats_smd <- metacont(data$nT, data$meanT, data$sdT, data$nC, data$meanC, data$sdC, sm="SMD") 

# display results
stats_smd

# create forest plot and display 
forest(stats_smd, studlab = paste(data$author, data$year))

# create funnel plot and display
funnel(stats_smd, studlab = paste(data$author, data$year))

# run meta-analysis based on ratio of mean differences
stats_rom <- metacont(data$nT, data$meanT, data$sdT, data$nC, data$meanC, data$sdC, sm="ROM") 

# display results
stats_rom

# create forest plot and display 
forest(stats_rom, studlab = paste(data$author, data$year))

# create funnel plot and display
funnel(stats_rom, studlab = paste(data$author, data$year))

# run meta-analyses based on alternative ways of calculating effect sizes

# use Cohen's d and display results
(stats_smd2 <- metacont(data$nT, data$meanT, data$sdT, data$nC, data$meanC, data$sdC, sm="SMD", method.smd="Cohen"))

# notice the command above is enclosed in parentheses to execute the code  
# and display the results using a single line of code.

# create forest plot
forest(stats_smd2, studlab = paste(data$author, data$year))

# create funnel plot
funnel(stats_smd2, studlab = paste(data$author, data$year))

# use Glass's delta and display results
(stats_smd3 <- metacont(data$nT, data$meanT, data$sdT, data$nC, data$meanC, data$sdC, sm="SMD", method.smd="Glass"))

# create forest plot
forest(stats_smd3, studlab = paste(data$author, data$year))

# create funnel plot
funnel(stats_smd3, studlab = paste(data$author, data$year))

# cite the R package you used to credit its author in your paper
citation("meta")
