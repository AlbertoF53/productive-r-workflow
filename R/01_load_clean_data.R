
library(tidyverse)
library(readxl)


# Loading penguin data ----------------------------------------------------

data <- read_excel("data/data.xlsx", na = "NA")



# Cleaning data by removing cases -----------------------------------------
# Removing rows 23 and 48

#Creating an id variable

data <- data |> 
  mutate(id = row_number())

#Removing cases 23 and 48, and saving a data_clean

data_clean <- data |> 
  filter(id != c(23, 48)) 

data_clean_v2 <- data |> 
  filter(id != c(23, 48)) 

# Saving clean database as RDS --------------------------------------------


data_clean <- write_rds(data_clean,
                        file = 'data/data_clean.rds')

#Another option to saving the data_clean using saveRDS

saveRDS(data_clean_v2, file = "data/data_clean_v2.rds")



