if (!file.exists("data")) {
  dir.create("data")
}

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "data/dataset.zip",
              method = "curl")

unzip("data/dataset.zip", exdir = "data")
