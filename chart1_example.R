top_states <- prison_jail_rates %>%
  group_by(state) %>%
  summarize(avg_incarceration_rate = mean(total_jail_pop_rate, na.rm = TRUE)) %>%
  top_n(10, wt = avg_incarceration_rate) %>%
  pull(state)

trend_data <- prison_jail_rates %>%
  filter(year >= 2000 & state %in% top_states) %>%
  group_by(year, state) %>%
  summarize(incarceration_rate = mean(total_jail_pop_rate, na.rm = TRUE))

ggplot(trend_data, aes(x = year, y = incarceration_rate, color = state)) +
  geom_line() +
  labs(title = "Trends in Incarceration Rates Over Time by Top 10 States",
       x = "Year",
       y = "Incarceration Rate",
       color = "State") +
  theme_minimal()

