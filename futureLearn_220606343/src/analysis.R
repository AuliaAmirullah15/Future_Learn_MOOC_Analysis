# Load project
library("ProjectTemplate")
load.project()

######################################
### Analysis 1 (Audience Pattern)  ###
######################################
## 1. The mean calculation of audience across continents over 7-year period
View(res)
stats_summaries_number <- res %>% 
  group_by(year) %>%
  summarise(europe = mean(europe_views_number),
            oceania = mean(oceania_views_number),
            asia = mean(asia_views_number),
            north_america = mean(north_america_views_number),
            south_america = mean(south_america_views_number),
            africa = mean(africa_views_number),
            antarctica = mean(antarctica_views_number))
stats_summaries_number

## 2. Transpose the the dataframe to fit into our analysis
df2 <- data.frame(t(stats_summaries_number[-1]))
df2
## 3. Copy the first column to create a new column called continent
df2 <- data.frame("continents"= rownames(df2), df2) 
df2

## 4. Delete columns which don't have column title
row.names(df2) <- NULL
df2
colnames(df2)

# 5. Melt data frame into long format
df3 <- melt(df2 ,  id.vars = 'continents', variable.name = 'year')
df3

## 5. Combine the value for all years into one to fit into our pie chart 
## to get an idea of the distribution of our audience
df_joined <- df3 %>% group_by(continents) %>% summarise(value=mean(value))
df_joined

# 6. Barplot and Pie Chart of Our Overall Distribution
bp <- ggplot(df_joined, aes(x="", y=value, fill=continents))+
  geom_bar(width = 1, stat = "identity")

pie <- bp + coord_polar("y", start=0) +
  labs(title = "Distribution of Audience") + 
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank(),
        plot.title=element_text(hjust=0.5)) +
  scale_fill_brewer("Continents", 
                    labels = c("Africa", "Antarctica", "Asia", 
                               "Europe", "North America",
                               "Oceania", "South America"),
                    palette="Blues")
pie


# 7. New facet label names for year variable
year.labs <- c("Year 3", "Year 4", "Year 5", "Year 6", "Year 7")
names(year.labs) <- c("X1", "X2", "X3", "X4", "X5")

# 8. Create line plot for each column in data frame
ggplot(df3, aes(x = continents, y = value, fill = continents)) +
  geom_bar(stat = 'identity') + 
  facet_wrap(~ year, 
             labeller = labeller(year = year.labs),
             nrow=2)  +
  labs(title = "Distribution of Audience",
       x = "Continents",
       y = "Number of Audience",
       color = "Continents") + 
  theme_bw() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        plot.title=element_text(hjust=0.5)) +
  scale_fill_brewer("Continents", 
                    labels = c("Africa", "Antarctica", "Asia", 
                               "Europe", "North America",
                               "Oceania", "South America"),
                    palette="Blues")



######################################
###  Analysis 2 (Content Pattern)  ###
######################################
## Create the plot to judge our analysis
ggplot(res, aes(step_position)) + 
  geom_line(aes(y = europe_views_number, colour = "Europe")) +
  geom_line(aes(y = oceania_views_number, colour = "Oceania")) + 
  geom_line(aes(y = asia_views_number, colour = "Asia")) + 
  geom_line(aes(y = north_america_views_number, colour = "North America")) + 
  geom_line(aes(y = south_america_views_number, colour = "South America")) + 
  geom_line(aes(y = africa_views_number, colour = "Africa")) + 
  geom_line(aes(y = antarctica_views_number, colour = "Antarctica")) + 
  facet_wrap(~ year) +
  labs(title = "Completion Pattern Across Continents Over 7-Year Period",
       x = "Step Position",
       y = "Number of Audience",
       color = "Continents") + 
  theme(plot.title=element_text(hjust=0.5))



