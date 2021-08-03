# Demo purrr and parameterised reprots

rmarkdown::render("example-parameterised.rmd", params = list(
  type = "Chinstrap"
))

all_species <- unique(palmerpenguins::penguins$species)

render_all <- function(param1){
  rmarkdown::render("example-parameterised.rmd", params = list(
    type = param1
  ),output_file = paste("report-",param1,"-analysis.html"))
  
}

purrr::map(all_species,render_all)
