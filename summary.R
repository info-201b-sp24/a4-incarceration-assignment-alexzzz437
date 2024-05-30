# Read the CSV files containing prison and jail population data from the URLs
prison_pop <- read_csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")
jail_pop <- read_csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-jail-pop.csv")
prison_jail_rates <- read_csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates.csv")
prison_jail_rates_1990 <- read_csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990.csv")
prison_jail_rates_1990_WA <- read_csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

# Calculate the mean incarceration rate for the total jail population rate
mean_incarceration_rate <- mean(prison_jail_rates$total_jail_pop_rate, na.rm = TRUE)

# Calculate the maximum incarceration rate for the total jail population rate
max_incarceration_rate <- max(prison_jail_rates$total_jail_pop_rate, na.rm = TRUE)

# Calculate the minimum incarceration rate for the total jail population rate
min_incarceration_rate <- min(prison_jail_rates$total_jail_pop_rate, na.rm = TRUE)

# Calculate the change in the mean incarceration rate from the first year to the last year in the dataset
change_incarceration_rate <- prison_jail_rates %>%
  filter(year == max(year, na.rm = TRUE)) %>%
  summarize(mean_rate_max_year = mean(total_jail_pop_rate, na.rm = TRUE)) %>%
  pull(mean_rate_max_year) -
  prison_jail_rates %>%
  filter(year == min(year, na.rm = TRUE)) %>%
  summarize(mean_rate_min_year = mean(total_jail_pop_rate, na.rm = TRUE)) %>%
  pull(mean_rate_min_year)

# Calculate the mean incarceration rates for different racial groups in the prison population
racial_group_incarceration_rates <- prison_pop %>%
  summarize(
    white_mean_rate = mean(white_prison_pop, na.rm = TRUE),
    black_mean_rate = mean(black_prison_pop, na.rm = TRUE),
    latinx_mean_rate = mean(latinx_prison_pop, na.rm = TRUE),
    aapi_mean_rate = mean(aapi_prison_pop, na.rm = TRUE),
    native_mean_rate = mean(native_prison_pop, na.rm = TRUE)
  )

# Print the calculated values
mean_incarceration_rate
max_incarceration_rate
min_incarceration_rate
change_incarceration_rate
racial_group_incarceration_rates