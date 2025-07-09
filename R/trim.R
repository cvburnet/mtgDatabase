load("./output/all_cards.Rda")
load("./output/card_prices.Rda")

# Inclusion Criteria: 
# 1.) Must be printed on paper, and not oversized. (isOnlineOnly, isOversized)
# 2.) Must not have been from a "funny" set. (isFunny)
# 3.) Prices are marked on TCGPlayer

my_cards <- all_cards |>
  filter(isOnlineOnly == "" & isOversized == "") |>
  filter(isFunny == "") |>
  filter(borderColor != "silver") |>
  select(uuid,name,manaCost,manaValue,
         type,supertypes,types,subtypes,side,colors,
         power,toughness,loyalty,defense,text,keywords,
         setCode,isReprint,hasFoil,hasNonFoil,flavorText,
         isAlternative,isFullArt,finishes)

# Pivot longer on basis of card finish...
my_cards <- my_cards |>
  separate_longer_delim(cols = finishes,
                        delim = ", ")

# Create "rules_text" variable, which takes out all reminder text.
my_cards <- my_cards |>
  mutate(
    rules_text = str_replace_all(text, "\\s*\\([^\\)]*\\)", "")
  )

# Grab card prices...
card_prices <- card_prices |>
  filter(gameAvailability == "paper" & priceProvider == "tcgplayer") |>
  select(uuid,cardFinish,date,price)


# Finding unique card names
unique_cards <- my_cards[which(!duplicated(my_cards$name)),]
unique_cards2 <- my_cards |>
  filter(isReprint == "" & isAlternative == "" & isFullArt == "")

# Grabbing legendary cards
legend_index <- (my_cards$supertypes == "Legendary")
legend_cards <- my_cards[legend_index,]

# Pondering...
ponder <- my_cards |>
  filter(name == "Ponder")
ponder_prices <- card_prices |>
  filter(uuid %in% ponder$uuid)

# Pondering prices...
ponder_price <- card_prices[(card_prices$uuid %in% ponder$uuid),]

# Emrakul!
emrakul <- my_cards |>
  filter(name == "Emrakul, the Aeons Torn")
emrakul_prices <- card_prices |>
  filter(uuid %in% emrakul$uuid)

# Most Verbose card:
verbose_card <- my_cards[which(str_length(my_cards$rules_text) == max(str_length(my_cards$rules_text))),] # Rules Lawyer? Master of the Hunt?
# Nope, it's Dance of the Dead!