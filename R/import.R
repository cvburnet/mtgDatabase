# Data can be found at https://mtgjson.com/api/v5/csv/.

# Documentation on the nature of the data can be found at:
  # https://mtgjson.com/data-models/card/card-atomic/

all_cards <- read.csv(file = "./input/cards.csv")
save(all_cards, file = "./output/all_cards.Rda")
