comparison_data <- prison_jail_rates %>%
  filter(!is.na(total_jail_pop_rate) & !is.na(total_pop))

ggplot(comparison_data, aes(x = total_pop, y = total_jail_pop_rate)) +
  geom_point(alpha = 0.5) +
  labs(title = "Comparison of Incarceration Rates and Total Population",
       x = "Total Population",
       y = "Incarceration Rate") +
  theme_minimal()

