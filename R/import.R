# Data can be found at https://mtgjson.com/api/v5/csv/.

# Documentation on the nature of the data can be found at:
  # https://mtgjson.com/data-models/card/card-atomic/

all_cards <- read.csv(file = "./input/cards.csv")
save(all_cards, file = "./output/all_cards.Rda")

card_prices <- read.csv(file = "./input/cardPrices.csv")
save(card_prices, file = "./output/card_prices.Rda")

set_info <- read.csv(file = "./input/sets.csv")
save(set_info, file = "./output/set_info.Rda")
