

library(plotly)
user_name = "louwjlabuschagne"
api_key = ""

Sys.setenv("plotly_username"=user_name)
Sys.setenv("plotly_api_key"=api_key)

df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv')

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
    z = ~GDP..BILLIONS., color = ~GDP..BILLIONS., colors = 'Reds',
    text = ~COUNTRY, locations = ~CODE, marker = list(line = l)
  ) %>%
  # colorbar(title = 'GDP Billions US$', tickprefix = '$') %>%
  layout(
    title = '2014 Global GDP<br>Source:<a href="https://www.cia.gov/library/publications/the-world-factbook/fields/2195.html">CIA World Factbook</a>',
    geo = g
    
    
  ) %>%  hide_colorbar() %>% layout(title = F)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
 chart_link = api_create(p, filename="9")
 chart_link
