test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

expect_error(data_return(1929), "Invalid input. Please enter a valid year between 1985 and 2022.")
expect_error(data_return('aaa'), "Invalid input. Please enter a valid year between 1985 and 2022.")
