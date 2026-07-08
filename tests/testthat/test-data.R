test_that("trips has the documented structure", {
  expect_s3_class(trips, "data.frame")
  expect_named(
    trips,
    c("fid", "numberplate", "date", "time", "lat", "lon", "plant")
  )
  expect_type(trips$fid, "integer")
  expect_type(trips$numberplate, "character")
  expect_s3_class(trips$date, "Date")
  expect_s3_class(trips$time, "hms")
  expect_type(trips$lat, "double")
  expect_type(trips$lon, "double")
  expect_type(trips$plant, "character")
})

test_that("trucks has the documented structure", {
  expect_s3_class(trucks, "data.frame")
  expect_named(trucks, c("numberplate", "volume"))
  expect_type(trucks$numberplate, "character")
  expect_type(trucks$volume, "double")
})

test_that("datasets are complete and identifiers are unique", {
  expect_false(anyNA(trips))
  expect_false(anyNA(trucks))
  expect_false(anyDuplicated(trips$fid) > 0)
  expect_false(anyDuplicated(trucks$numberplate) > 0)
})

test_that("every trip joins to a truck", {
  expect_in(trips$numberplate, trucks$numberplate)
})

test_that("values are within plausible ranges", {
  # Coordinates lie within Uganda; dates within the documented collection
  # period; volumes within plausible vacuum truck sizes.
  expect_true(all(trips$lat > -1.5 & trips$lat < 4.5))
  expect_true(all(trips$lon > 29.5 & trips$lon < 35.5))
  expect_true(all(trips$date >= as.Date("2015-03-30")))
  expect_true(all(trips$date <= as.Date("2015-06-25")))
  expect_true(all(trucks$volume >= 2 & trucks$volume <= 12))
  expect_setequal(unique(trips$plant), c("Bugolobi", "Lubigi"))
})
