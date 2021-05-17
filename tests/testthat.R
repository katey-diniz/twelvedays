library(testthat)
library(twelvedays)


test_check("twelvedays")

context("make_phrase")

test_that("make_phrase test1", {

  Day <- 7
  Day.in.Words <- "seventh"
  Gift.Item <- "chicken"
  Verb <- "running"
  Adjective <- NA
  Location <- NA
  expect_equal(make_phrase(Day, Day.in.Words, Gift.Item, Verb, Adjective, Location), "seven chickens running")


})

context("pluralize")

test_that("pluralize test1", {

  words <- c("chicken", "goose", "bunny", "cow")
  expect_equal(pluralize_gift(words), c("chickens", "geese", "bunnies", "cows"))


})

context("sing_day")

test_that("sing_day test1", {

  dataset <- read.csv("https://www.dropbox.com/s/e584pryn8evm1gz/xmas.csv?dl=1")
  line <- 2
  dataset <- dataset %>%
    mutate(
      Full.Phrase =
        pmap(list(
          num = Day,
          num_word = Day.in.Words,
          item = Gift.Item,
          verb = Verb,
          adj = Adjective,
          location = Location
        ), make_phrase
        ))
  phrase_col <- "Full.Phrase"
  expect_equal(sing_day(dataset, line, phrase_col), "On the second day of Christmas,
my true love gave to me,
two turtle doves,
and a partridge in a pear tree.")


})
