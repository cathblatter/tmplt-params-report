# this is the R code used to produce the sample-dataset

set.seed(42)
library(tidyverse)


# create three centers with following properties

# center 501 has a total of 19 respondents within 2 units (n=10 and n=9)
one <- 
  tibble(ARCHIV = seq(1L, 19L, 1L), 
         center = 501L, 
         ABTEIL = sample(c(501010L, 501011L), size = 19, 
                         replace = T, prob = c(.55, .45)))

# center 502 has 35 respondents in 4 units
two <- 
  tibble(ARCHIV = seq(1L, 35L, 1L), 
         center = 502L, 
         ABTEIL = sample(c(502010L, 502011L, 502012L, 502013L), size = 35, 
                         replace = T, prob = c(.3, .3, .1, .3)))

# center 503 has 46 respondents in 3 units
three <- 
  tibble(ARCHIV = seq(1L, 46L, 1L), 
         center = 503L, 
         ABTEIL = sample(c(503010L, 503011L, 503012L), size = 46, 
                         replace = T, prob = c(.3, .3, .3)))

# bind the data together and add random variables
# variable V1 to V4 are 4-scale-answers to the PES-NWI (Lake et al., 2008) - 
# e.g. subscale leadership
# variable V5 to V8 are answers to NASA-TLX (7 point answers)
# V9 holds information on respondent's gender
sample_data <- 
  bind_rows(one, two, three) %>% 
  mutate(V1 = sample(c(1L, 2L, 3L, 4L, NA_integer_), size = 100, T),
         V2 = sample(c(1L, 2L, 3L, 4L, NA_integer_), size = 100, T),
         V3 = sample(c(1L, 2L, 3L, 4L, NA_integer_), size = 100, T),
         V4 = sample(c(1L, 2L, 3L, 4L, NA_integer_), size = 100, T), 
         V5 = sample(c(1L:7L, NA_integer_), size = 100, T),
         V6 = sample(c(1L:7L), size = 100, T),
         V7 = sample(c(1L:7L, NA_integer_), size = 100, T),
         V8 = sample(c(1L:7L), size = 100, T), 
         V9 = sample(c("m", "f", "prefers no answer", NA_character_), 100, T, c(.2, .7, .05, .05)))

rm(one, two, three)

# save data
write_csv(sample_data, file = here::here("data/sample_data.csv"))