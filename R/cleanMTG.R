tidy_dat <- JSONData |>
#  drop_na(tcgplayer_id) |>
  filter(digital != TRUE) |>
  arrange(name) |>
  arrange(released_at) |>
  filter(set_type != 'funny') |>
  filter(set_type != 'memorabilia') |>
  filter(set_type != 'token')
tidy_dat$id <- NULL
tidy_dat$oracle_id <- NULL
tidy_dat$multiverse_ids <- NULL
tidy_dat$mtgo_foil_id <- NULL
tidy_dat$mtgo_id <- NULL
tidy_dat$cardmarket_id <- NULL
tidy_dat$object <- NULL
tidy_dat$lang <- NULL
tidy_dat$uri <- NULL
tidy_dat$scryfall_set_uri <- NULL
tidy_dat$scryfall_uri <- NULL
tidy_dat$highres_image <- NULL
tidy_dat$image_status <- NULL
tidy_dat$image_uris <- NULL
tidy_dat$set_id <- NULL
tidy_dat$all_parts <- NULL
tidy_dat$game_changer <- NULL
tidy_dat$set_uri <- NULL
tidy_dat$set_search_uri <- NULL
tidy_dat$rulings_uri <- NULL
tidy_dat$prints_search_uri <- NULL
tidy_dat$card_back_id <- NULL
tidy_dat$artist_ids <- NULL
tidy_dat$illustration_id <- NULL
tidy_dat$preview <- NULL
tidy_dat$prices$usd_etched <- NULL
tidy_dat$prices$eur <- NULL
tidy_dat$prices$eur_foil <- NULL
tidy_dat$prices$tix <- NULL
tidy_dat$related_uris <- NULL
tidy_dat$purchase_uris <- NULL

save(tidy_dat, file = "./output/data.Rda")
