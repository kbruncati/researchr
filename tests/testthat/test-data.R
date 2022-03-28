test_that("multiplication works", {
  x <- 5 #expect that expressions are equal
  class(x) <- c("print_emoji", class(x))
  expect_output(print(x), "hey")
  expect_equal(as.double(x), 5)
  expect_s3_class(x,"print_emoji")
})
