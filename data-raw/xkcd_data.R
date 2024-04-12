## code to prepare `xkcd_data` dataset goes here

# Can use library() here because this is ignored when package is built. As far as users are
# concerned, this doesn't exist, so it won't mess with their search path. Can treat the files in
# /data-raw as own personal R scripts.
library(jsonlite)

json_objects <- vector(mode = "list", 10)

for (i in 1:10) {
  url <- file.path("https://xkcd.com", i, "info.0.json")
  json_objects[[i]] <- jsonlite::read_json(url)
  # Good practice to not constantly harass API, might get timed out anyway.
  Sys.sleep(1)
}

xkcd <- do.call(rbind, json_objects)
xkcd <- as.data.frame(xkcd)

usethis::use_data(xkcd_data, overwrite = TRUE)
