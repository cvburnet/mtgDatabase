load("./output/all_cards.Rda")

# Inclusion Criteria: 
# 1.) Must be printed on paper, and not oversized. (isOnlineOnly, isOversized)
# 2.) Must not have been from a "funny" set. (isFunny)
# 3.) 

trimmed_cards <- all_cards |>
  filter(isOnlineOnly == "" & isOversized == "") |>
  filter(isFunny == "")

vars_needed <- c("uuid","name","manaCost","manaValue",
                 "type","supertypes","types","subtypes","side","colors",
                 "power","toughness","loyalty","defense","text","keywords",
                 "printings","setCode","isReprint","hasFoil","hasNonFoil","flavorText",
                 "isAlternative","isFullArt")

my_cards <- trimmed_cards[,vars_needed]
my_cards$printings <- str_split(trimmed_cards[,"printings"],", ")

unique_cards <- my_cards[which(!duplicated(my_cards$name)),]
unique_cards2 <- my_cards |>
  filter(isReprint == "" & isAlternative == "" & isFullArt == "")


legend_index <- (my_cards$supertypes == "Legendary")
legend_cards <- my_cards[legend_index,]
