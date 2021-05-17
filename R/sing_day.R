#' Produces the string for one day of the song.
#'
#' @param dataset A data frame containing information about gifts
#' @param line The number of the line for the day you want to sing about
#' @param phrase_col The variable name for the column in the dataset that
#' contains the gift phrases
#'
#' @return A string singing the line of the song with all gifts for the given day.
#'
#' @import stringr
#' @import dplyr
#' @import glue
#' @import purrr
#' @import xfun
#' @import english
#'
#' @export
sing_day <- function(dataset, line, phrase_col){

  phrases <- dataset %>% pull({{phrase_col}})

  hold <- map(phrases[line:2], glue)

  saying <- glue("On the {ordinal(line)} day of Christmas,
        my true love gave to me, ") %>%
    cat(paste("\n", str_trim(hold), ",", sep="")) %>%
    cat(paste("\n", "and ", phrases[1], ".", sep = ""))

}
