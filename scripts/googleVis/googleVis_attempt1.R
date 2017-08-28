# install.packages("googleVis")

#simple interactive plots
library(googleVis)
library(tidyverse)
department <- tribble(~student_id, ~age, ~country,
              1,   49, "Australia",
              2,   50, "Japan",
              3,   60, "United Kingdom"
)
df = as.data.frame(department)

G1 <- gvisGeoMap(df, locationvar='country', numvar='age',
                 options=list(dataMode="regions")) 

 # G1 <- gvisGeoMap(Exports, locationvar='Country', numvar='Profit',
 #                  options=list(dataMode="regions")) 

plot(G1)

library(knitr)
library(markdown)

wd <- getwd()
setwd(tempdir())
fn=tempfile()
fn.Rmd <- paste(fn, ".Rmd", sep="")
fn.md <- paste(fn, ".md", sep="")
fn.html <- paste(fn, "-out.html", sep="") 
## Write R Markdown into a file
cat(knitrRmd, file=fn.Rmd)
render_markdown()
knit(fn.Rmd, fn.md)
knit2html(fn.md)



#choropleth

