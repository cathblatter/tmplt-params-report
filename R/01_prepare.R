# Prepare the data for reporting, i.e. creating a 
# filtered_data with the data for the target center
# you can pass the argument through the params$center command

filtered_data <- 
  sample_data %>% 
  filter(center %in% params$center)