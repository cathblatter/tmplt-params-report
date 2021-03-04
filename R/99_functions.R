# this file holds functions for calculation


# Part 1: Calculation funs ------------------------------------------------

#' Title
#'
#' @param df 
#' @param columns 
#' @param restrict_level 
#'
#' @return
#' @export
#'
#' @examples
calc_global_tbl <- function(df, 
                           columns, 
                           restrict_level = params$restrict_level, 
                           text_df = sample_textanswers,
                           language = params$language){
  
  df2 <- 
  df %>% 
    summarise(across(any_of({{columns}}), 
                     list(nvalid = ~n_valid(.),
                          prpagree = ~prop_agree(., 
                                                  cutoff = c(3,4), 
                                                  restrict_level = restrict_level)))) %>% 
    pivot_longer(cols = everything(),
                 names_to = c("Item", ".value"),
                 names_pattern = "(.*)_(.*)")
  
  text_df2 <- 
    text_df %>% 
    filter(language == {{language}}) %>% 
    filter(Item %in% {{columns}}) %>% 
    select(-language)
    
  left_join(text_df2, df2, by = "Item")
  
}

calc_unit_tbl <- function(df, 
                           columns, 
                           restrict_level = params$restrict_level){
  
  df %>% 
    group_by(ABTEIL) %>% 
    summarise(across(any_of({{columns}}), 
                     list(prpagree = ~prop_agree(., 
                                                 cutoff = c(3,4), 
                                                 restrict_level = restrict_level)))) %>% 
    pivot_longer(cols = -ABTEIL,
                 names_to = c("Item", ".value"),
                 names_pattern = "(.*)_(.*)") %>% 
    pivot_wider(names_from = "ABTEIL", 
                values_from = prpagree)
  
}


# Part 2: Styling funs ------------------------------------------------------------



#' Title
#'
#' @param df a dataframe calculated by my_calculation()
#' @param language what langauge to choose for headers - defaults to params$language
#'
#' @return
#' @export
#'
#' @examples
style_global_tbl <- function(df,
                             language = params$language, 
                             caption = NULL){
  
  
  # choosing the right header by language
    col_headers <- if(language == "DE"){ 
      c("Item", "Text", "Gültiges N", "% Zustimmung") } else if(language == "FR"){
       c("Item", "texte francais", "francais1", "d'Approbations") } else if(language == "IT"){
         # define italian headers here 
         }
  
  # format the percentages with the scales-package percent-function
  df %>% 
    mutate(prpagree = percent(prpagree, accuracy = .1, suffix = "")) %>% 
    kable(., 
        col.names = col_headers, 
        escape = TRUE,
        caption = caption, 
        booktabs = TRUE, 
        align = c("l", "l", rep("r", ncol(df)-2))) %>% 
    kable_styling(latex_options = "hold_position",
                  full_width = TRUE) %>% 
    column_spec(1, width = "2em")  %>% 
    column_spec(2, width = "22em") # style width of second column
}


style_unit_tbl <- function(df, caption = NULL, language = params$language){
  
  # choosing the right header by language
  # header is a named character vector with colspan as values, 
  # first asign the colspan (relative to table size)
  header_above = c(" " = 1, "bb" = ncol(df)-1)

  # then set the header by language
  names(header_above) <- if(language == "DE"){ 
    c(" ", "Abteilungen") } else if(language == "FR"){
      c(" ", "vos unites") } else if(language == "IT"){
        # define italian headers here 
      }
  
  df %>% 
    mutate(across(c(-1), ~percent(., accuracy = .1, suffix = ""))) %>% 
    kable(., 
          escape = TRUE,
          caption = caption, 
          booktabs = TRUE, 
          align = c("l", rep("r", ncol(df)-1))) %>% 
    kable_styling(latex_options = "hold_position",
                  full_width = FALSE) %>%
    add_header_above(., header = header_above)
    
}
