# input: data from Bowler History on LeagueSecretary.com
# output: long format, scores and averages by Date and Game for each week
bowler_long_dat <- function(bowler_dat) {

  dat <- bowler_dat %>%
    select(Date, Gm1, Gm2, Gm3, Todays.br...Avg, Avg.br...Before) %>%
    mutate(Date = as.Date(Date, format = "%m/%d/%Y")) %>%
    rename(
      `1` = Gm1,
      `2` = Gm2,
      `3` = Gm3,
      `League Average` = Avg.br...Before,
      `Week Average` = Todays.br...Avg
    ) %>%
    tidyr::gather(Game, Score, -Date, -`League Average`, -`Week Average`) %>%
    select(Date, Game, `Week Average`, `League Average`, Score) %>%
    arrange(Date, Game)
  
  return(dat)
}

# input: data from Bowler History on LeagueSecretary.com
# output: plot of scores and averages by Date and Game
bowler_wk_plt <- function(bowler_dat) {
  plt_dat <- bowler_long_dat(bowler_dat)
  
  p <- plt_dat %>%
    ggplot(aes(x = Date,
               alpha = 0.9)) +
    geom_bar(
      aes(y = Score,
          fill =  Game),
      stat = "sum",
      position = position_dodge(),
      show.legend = c(
        size = FALSE,
        alpha = FALSE,
        shape = FALSE
      )
    ) +
    geom_line(
      aes(y = `League Average`,
          color = "League Average"),
      size = 1.2,
      show.legend = c(
        size = FALSE,
        alpha = FALSE,
        shape = FALSE
      )
    ) +
    geom_point(
      aes(y = `Week Average`,
          color = "Week Average",
          size = 1),
      shape = 6,
      show.legend = c(
        size = FALSE,
        alpha = FALSE,
        shape = FALSE
      )
    ) +
    theme_minimal() +
    scale_fill_manual(
      guide = "none",
      values = wes_palettes$GrandBudapest1[c(2, 1, 4)],
      labels = c("Game 1", "Game 2", "Game 3")
    ) +
    scale_color_manual(
      guide = "none",
      values = c("#FD6467", "#5B1A18"),
      labels = c("League Average", "Week Average")
    ) +
    ggtitle("Bowler Scores by Week and Game")
  
  plty <- plotly::ggplotly(p, tooltip = c("y", "x", "fill"))
  
  plty[['x']][['data']][[1]][['name']] <- "Game 1"
  plty[['x']][['data']][[2]][['name']] <- "Game 2"
  plty[['x']][['data']][[3]][['name']] <- "Game 3"
  plty[['x']][['data']][[4]][['name']] <- "League Average"
  plty[['x']][['data']][[5]][['name']] <- "Week Average"
  
  return(plty)
}
