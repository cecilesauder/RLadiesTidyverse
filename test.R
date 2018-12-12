#readr
data_movies <- read_csv("data/tmdb_5000_movies.csv")
data_credits <- read_csv("data/tmdb_5000_credits.csv")


##purrr
both <- list("data_movies" = data_movies, "data_credits" = data_credits)

both %>%
  map(names)



#tibble + dplyr
data_movies
#
glimpse(data_movies)

both %>%
  map(glimpse)


#je vais faire une colonne production

#J'ai envie de comparer les budgets des films Disney et Marvel. 

#Top 5 des votes, des budgets, des revenues, popularity


### dplyr
data_movies %>%
  select(original_title, budget, revenue, vote_average, popularity) %>%
  arrange(desc(budget))

data_movies %>%
  select(original_title, budget, revenue, vote_average, popularity) %>%
  arrange(desc(budget))


#dplyr and stringr
data_movies <- data_movies %>%
  mutate(Production = case_when(
    str_detect(production_companies,"Disney") ~ "Disney",
    str_detect(production_companies,"Marvel") ~ "Marvel",
    str_detect(production_companies,"DC") ~ "DC",
    TRUE ~ "Other"
  ))

# je voudrais compter combien y a de films de chaque levels et faire un barplot avec 

#dplyr 
data_movies %>%
  count(Production, sort = TRUE)

data_movies %>%
  ggplot(aes(x=Production, fill = Production)) +
  geom_bar()


data_movies2 <- data_movies %>%
  filter(Production != "Other")

data_movies2 %>%
  ggplot(aes(x=Production, fill = Production)) +
  geom_bar()

data_movies2 %>%
  ggplot(aes(x=budget, y= vote_average, col = Production, label = original_title)) +
  geom_smooth() +
  facet_wrap(~Production) +
  geom_text(check_overlap = TRUE)

## 

data_movies %>%
  group_by(Production) %>%
  top_n(5, revenue) %>%
  select(original_title, budget, revenue, vote_average)



## gather spread

spread_data <- data_movies2 %>%
  spread(key = Production, value = vote_average)

spread_data %>%
  gather(key = "Prod", value = "vote", -title, -budget) %>%
  filter(!is.na(vote))




