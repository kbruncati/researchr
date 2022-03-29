test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

expect_equal(data_return(1929), "Invalid input. Please enter a valid year between 1985 and 2022.")
expect_equal(data_return('aaa'), "Invalid input. Please enter a valid year between 1985 and 2022.")
expect_equal(data_return(2020), xmlToDataFrame('RePORTER_PRJ_X_FY2020_new.xml'))
