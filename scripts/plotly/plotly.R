

library(plotly)
# user_name = "louwjlabuschagne"
# api_key = ""

# Sys.setenv("plotly_username"=user_name)
# Sys.setenv("plotly_api_key"=api_key)

df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv')
head(df)
library(tidyverse)
department <- tribble(~student_id, ~age, ~country,
                      1,   49, "Australia",
                      2,   50, "Japan",
                      3,   60, "United Kingdom"
)
df = as.data.frame(department)

# light grey boundaries
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)

p <- plot_geo(df) %>%
  add_trace(
    z = ~age, color = ~age, colors = 'Reds',
    text = ~country, locations = ~CODE, marker = list(line = l)
  ) %>%
  # colorbar(title = 'GDP Billions US$', tickprefix = '$') %>%
  layout(
    title = '2014 Global GDP<br>Source:<a href="https://www.cia.gov/library/publications/the-world-factbook/fields/2195.html">CIA World Factbook</a>',
    geo = g
    
    
  ) %>%  hide_colorbar() %>% layout(title = F)

htmlwidgets::saveWidget(as_widget(p)
                        , paste0("map.html", sep="")
                        , selfcontained=T)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
 # chart_link = api_create(p, filename="9")
 # chart_link
