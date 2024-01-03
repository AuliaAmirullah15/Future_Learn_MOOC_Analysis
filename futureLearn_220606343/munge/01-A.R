#install.packages("dplyr")
library(dplyr)

# List all our datasets.
datasets = list(NULL, NULL, cyber.security.3_video.stats, cyber.security.4_video.stats, 
                cyber.security.5_video.stats, cyber.security.6_video.stats,
                cyber.security.7_video.stats)

variable_name = "video_stats_"
  
# DATA WRANGLING
for(i in 1:length(datasets)) { # loop through the datasets list
  if (!is.null(datasets[i][[1]])) { # Datasets of the year 1 and 2 are not available
    temp <- datasets[i][[1]] %>% 
      select(
        step_position:total_views, # select all columns from step_position to total_views from the raw data
        ends_with("views_percentage")) %>% # select all columns with the ending "views_percentage"
      mutate_all(~replace(., is.na(.), 0)) %>% # Data Cleaning to remove by changing NA/ null to 0 as it is video stats
      mutate(year = i, # add a column called year
             europe_views_number = round((europe_views_percentage / 100) * total_views, digits = 0), # add columns by converting percentage to number
             oceania_views_number = round((oceania_views_percentage/ 100) * total_views, digits = 0),
             asia_views_number = round((asia_views_percentage / 100) * total_views, digits = 0),
             north_america_views_number = round((north_america_views_percentage / 100) * total_views, digits = 0),
             south_america_views_number = round((south_america_views_percentage / 100) * total_views, digits = 0),
             africa_views_number = round((africa_views_percentage / 100) * total_views, digits = 0),
             antarctica_views_number = round((antarctica_views_percentage / 100) * total_views, digits = 0))
    
    # create a new variable by using assign and paste0 to combine strings 
    assign(paste0(variable_name,i), temp)
  }
}


# combine all preprocessed data into a brand new data frame
datalist = list() ## make an empty list
for(i in 1:length(datasets)) {
  if (!is.null(datasets[i][[1]])) {
    datalist[i] <- lapply(paste0(variable_name, i), get)  # get variables 
  }
}

res = do.call(rbind, datalist) ## stack datasets into one dataset
