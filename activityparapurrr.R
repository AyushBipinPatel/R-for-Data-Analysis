#### activity para

library(AER)

data("Fatalities")

unique(Fatalities$state) ->all_state

gen_rep_all_states <- function(s_name){
  
  rmarkdown::render(input = "activity-para.Rmd",
                    params = list(
                      reg = s_name
                    ),
                    output_file = paste(s_name,"fatalities-data.html",
                                        sep = "")
                      )
  
}


purrr::map(all_state,gen_rep_all_states)
