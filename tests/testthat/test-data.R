expect_error(nih_research(1929))
expect_error(nih_research('aaa'))
expect_s3_class(nih_research(1999), 'data.frame')
#expect_equal(nrow(data_2021), )
