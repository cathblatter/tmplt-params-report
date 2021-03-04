

# 1. Full dataset ---------------------------------------------------------

# Prepare the data for reporting, i.e. creating a 
# filtered_data with the data for the target center
# you can pass the argument through the params$center command

if (params$center == 999) {
  # this loop actually does not filter
  # this allows you to get an 'overall' score
  # by the fake center-code '999'
  filtered_data <- sample_data } else {
    
    #this loops actually filters the data by its center(s)
    filtered_data <- 
      sample_data %>% 
      filter(center %in% params$center)
  }


# 2. Dichotomize dataset --------------------------------------------------


