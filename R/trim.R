load("./output/all_cards.Rda")

vars_needed <- c("uuid","name","manaCost","manaValue",
                 "type","supertypes","types","subtypes","side","colors",
                 "power","toughness","loyalty","defense","text","keywords",
                 "printings","hasFoil","hasNonFoil","flavorText")

my_cards <- all_cards[,vars_needed]
my_cards$printings <- str_split(all_cards[,"printings"],", ")

legend_index <- (my_cards$supertypes == "Legendary")
legend_cards <- my_cards[legend_index,]
