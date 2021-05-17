#' Takes a noun and makes it plural
#'
#' @param gift A string or vector of strings
#'
#' @return A string or vector of strings with the pluralized words
#'
#' @import stringr
#' @import dplyr
#' @import glue
#' @import purrr
#' @import xfun
#' @import english
#'
#' @export
pluralize_gift <- function(gift){

  gift <- gift %>%
    paste0("s") %>%
    str_replace("ys$", "ies") %>%
    str_replace("o{2}", "ee") %>%
    str_replace("(?<=eese)s$", "")

  return(gift)

}
