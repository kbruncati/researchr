expect_error(nih_research(1929), "Invalid input. Please enter a valid year between 1985 and 2022.")
expect_error(nih_research('aaa'), "Invalid input. Please enter a valid year between 1985 and 2022.")
expect_s3_class(nih_research(1999), 'data.frame')
#expect_equal(nrow(data_2021), )
