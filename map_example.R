us_states <- map_data("state")

state_lookup <- data.frame(
  abbreviation = c("al", "ak", "az", "ar", "ca", "co", "ct", "de", "dc", "fl", "ga", "hi", "id", "il", "in", "ia", "ks", "ky", "la", "me", "md", "ma", "mi", "mn", "ms", "mo", "mt", "ne", "nv", "nh", "nj", "nm", "ny", "nc", "nd", "oh", "ok", "or", "pa", "ri", "sc", "sd", "tn", "tx", "ut", "vt", "va", "wa", "wv", "wi", "wy"),
  full_name = c("alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "district of columbia", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new hampshire", "new jersey", "new mexico", "new york", "north carolina", "north dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode island", "south carolina", "south dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west virginia", "wisconsin", "wyoming")
)

us_states <- us_states %>%
  mutate(region = tolower(region))

incarceration_data <- data.frame(
  state = tolower(state_lookup$full_name),
  incarceration_rate = runif(length(state_lookup$full_name), min = 100, max = 1000) # Replace with actual data
)

us_states <- us_states %>%
  left_join(state_lookup, by = c("region" = "full_name"))

map_data <- us_states %>%
  left_join(incarceration_data, by = c("region" = "state"))

ggplot(map_data, aes(x = long, y = lat, group = group, fill = incarceration_rate)) +
  geom_polygon(color = "white") +
  labs(title = "Geographical Distribution of Incarceration Rates",
       fill = "Incarceration Rate") +
  scale_fill_continuous(low = "lightblue", high = "darkblue", na.value = "grey50") +
  theme_minimal() +
  coord_map()
