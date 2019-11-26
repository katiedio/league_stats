bowler_dat <- read.csv("./data/will-menasian-history.csv")

library(dplyr)
library(tidyr)
library(ggplot2)
library(wesanderson)

# bowler score by game by week

ggplotly( 
  
  bowler_dat %>% 
  select(Date, Gm1,Gm2, Gm3, Todays.br...Avg, Avg.br...Before) %>% 
   mutate(Date = as.Date(Date, format = "%m/%d/%Y")) %>% 
    rename(Game1 = Gm1,
          Game2 = Gm2, 
          Game3 = Gm3,
          WeekAverage = Todays.br...Avg,
          AverageAfter = Avg.br...Before) %>% 
   gather(Gm, score, -Date) %>% 
   ggplot(aes(x = Date, y = score, color = Gm)) +
  geom_line() +
  geom_point() +
  facet_grid(Gm~.)
  
  )

plotly::ggplotly( 
  
  bowler_dat %>% 
    select(Date, Gm1,Gm2, Gm3, Todays.br...Avg, Avg.br...Before) %>% 
    mutate(Date = as.Date(Date, format = "%m/%d/%Y")) %>% 
    rename(`Game 1` = Gm1,
           `Game 2` = Gm2, 
           `Game 3` = Gm3,
           `League Average` = Avg.br...Before,
           `Week Average` = Todays.br...Avg) %>% 
    gather(Game, Score, -Date, -`League Average`, -`Week Average`) %>% 
    ggplot(aes(x = Date)) +
    geom_bar(aes(y = Score, 
                 fill = Game,
                 alpha = 0.7), 
             stat = "sum", 
             position = position_dodge()) + 
    geom_line(aes(y = `League Average`),
              color = "#5B1A18",
              linetype = "dashed",
              size = 1.2) +
    geom_point(aes(y = `Week Average`),
              shape = 6,
              size = 2.5,
              color = "#D67236") +
    theme_minimal() +
    scale_fill_manual(values = wes_palette(name = "GrandBudapest1")) 
)

# average by week/ change in average by week



