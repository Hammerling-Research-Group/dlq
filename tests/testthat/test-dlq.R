library(testthat)
library(here)

# Check if configuration file is read correctly
test_that("Configuration file is read correctly", {
  config_file_path <- here::here("R", "input_data", "simulation_config.txt")
  config <- read.table(config_file_path)
  config <- strsplit(config[,1], "=")
  parameters <- sapply(config, function(X) X[1])
  values <- sapply(config, function(X) X[2])
  expect_true(length(parameters) > 0)
  expect_true(length(values) > 0)
})

# Check if sensor data is loaded correctly
test_that("Raw data is loaded correctly", {
  raw_data <- read.csv(here::here("R", "input_data", "ADED_data_clean.csv"))
  expect_true(nrow(raw_data) > 0)
  expect_true("time" %in% colnames(raw_data))
})

# Test if sensor location data is read correctly
test_that("Sensor location data is read correctly", {
  sensor_locs <- read.csv(here::here("R", "input_data", "sensor_locations.csv"))
  expect_true(nrow(sensor_locs) > 0)
  expect_true(all(c("name", "lat", "lon", "height") %in% colnames(sensor_locs)))
})

# Check if wind data combination works correctly
test_that("Wind data combination works correctly", {
  n.r <- 5
  raw_data <- data.frame(name = rep(letters[1:n.r], each = 10),
                         time = seq.POSIXt(Sys.time(), by = "min", length.out = 10 * n.r),
                         wind.speed = runif(10 * n.r),
                         wind.direction = runif(10 * n.r, 0, 360))
  sensor_locs <- data.frame(name = letters[1:n.r], lat = runif(n.r), lon = runif(n.r), height = runif(n.r))
  wind_unit <- vector(length = n.r)
  for (r in 1:n.r) {
    these_raw_data <- raw_data[raw_data$name == sensor_locs$name[r], ]
    wind_unit[r] <- any(!is.na(these_raw_data$wind.speed))
  }
  expect_true(length(wind_unit) == n.r)
})

# Test if wind direction calculations are correct
test_that("Wind direction calculations are correct", {
  WD <- runif(10, 0, 360)
  WD <- WD * pi/180
  WD.x <- cos(WD)
  WD.y <- sin(WD)
  WD.x <- zoo::na.approx(WD.x, maxgap = 5, na.rm = F)
  WD.y <- zoo::na.approx(WD.y, maxgap = 5, na.rm = F)
  WD <- atan2(WD.y, WD.x) * 180 / pi
  WD <- ifelse(WD < 0, WD + 360, WD)
  WD <- 90 - WD
  WD <- ifelse(WD < 0, WD + 360, WD)
  WD <- 180 + WD
  WD <- ifelse(WD >= 360, WD - 360, WD)
  WD <- WD * pi/180
  expect_true(all(WD >= 0 & WD <= 2 * pi))
})

# Test the Gaussian puff concentration calculations
test_that("Gaussian puff concentration calculations are correct", {
  source(here::here("R", "helpers", "HELPER_gpuff_function.R"))
  source.x <- 0 
  source.y <- 0
  x.r <- c(50, 100) 
  y.r <- c(50, 100) 
  z.r <- c(2, 2) 
  total.dist <- 100 
  Q.truth <- 0.001
  stab.class <- "D"
  WS <- 3 
  H <- 10 
  concentration <- gpuff(Q = Q.truth, stab.class = stab.class, x.p = source.x, y.p = source.y,
                         x.r.vec = x.r, y.r.vec = y.r, z.r.vec = z.r, total.dist = total.dist,
                         H = H, U = WS)
  expect_true(all(concentration >= 0))
})
