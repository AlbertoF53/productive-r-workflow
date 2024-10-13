#*************** Functions Receptacle *************************
#*
#* Author: Alberto F Cabrera
#* Date: July 19, 2024
#* 
#* This file contains all functions created
#* 
#* *****************************************************************************
#*


library(tidyverse)
library(gt)
library(gtExtras)
library(scales)
library(hrbrthemes)



# Function to create scatterplot for penguins -----------------------------


create_scatterplot <- function(selected_data, selected_species,selected_island) {
  
  #Filtered data by removing missing cases
  filtered_data <-  selected_data |> 
    filter(!is.na(bill_depth_mm)) |> 
    filter(!is.na(bill_length_mm))
  
  
  #Create the scatterplot
  
  plot <- ggplot(
    data = filtered_data,
    aes(x = bill_length_mm, y = bill_depth_mm,
        color = species,
        shape = species) ) +
    geom_point() +
    labs(
      x = "Bill length (mm)",
      y = "Bill depth (mm)",
      title = paste("Penguin Bill Dimensions -", selected_species, "-", selected_island )
    ) +
    theme_minimal(base_size = 14,
                  base_family = "Source Sans Pro") +
    theme(panel.grid.minor = element_blank(),
          plot.title.position = "plot")
  
  return(plot)
  
}


# ggplot yan_holtz_theme_function -----------------------------------------

yan_holtz_theme <- function() {
  theme_ipsum() +
    theme(
      plot.title = element_text(color = "#69b3a2", size = 18, face = "bold"),
      axis.text.x = element_text(size = 7),
      axis.text.y = element_text(size = 7)
    )
}


