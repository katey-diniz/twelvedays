#' Puts the various parts of speech together into a full phrase.
#'
#' @param num An integer
#' @param num_word A string corresponding to the integer
#' @param item A string
#' @param verb A string
#' @param adjective A string
#' @param location A string
#'
#' @return A string containing the words in grammatical order.
#'
#' @import stringr
#' @import glue
#' @import dplyr
#' @import purrr
#' @import xfun
#' @import english
#'
#' @export



make_phrase <- function(num, num_word, item, verb, adjective, location){

  verb <- str_replace_na(verb, "")
  adjective <- str_replace_na(adjective, "")
  location <- str_replace_na(location, "")
  english <- english(num)
  item <- case_when(
    num != 1 ~ pluralize_gift(item),
    num == 1 ~ item)

  hold <- case_when(
    num != 1 ~ paste(english, adjective, item, verb, location),
    num == 1 ~ paste("a", adjective, item, verb, location))

  str_replace_all(hold, "  ", " ")


}

