
df1 <- read.csv("C:\\Users\\LENOVO\\Downloads\\690V Project.csv")
head(df1)
summary(df1)
str(df1)


library(ggplot2)


draft1 <- ggplot(data = df1, aes(x = Industry)) +
  geom_bar(fill = "skyblue", color = "black") +  # Customize bar aesthetics
  labs(title = "Distribution of Companies by Industry",
       x = "Industry",
       y = "Count",
       caption = "Source : Kaggle" ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.background = element_rect(fill = "white"))
draft1
#dashboard save
saveRDS(draft1,"draft1.rds")



Plot2=ggplot(df1, aes(x = Country, y = Percentage)) +
  geom_point(stat = "summary", fun = "mean", fill = "skyblue", color = "black") +
  labs(title = "Percentage of Unemployment by Country",
       x = "Country",
       y = "Percentage of Unemployment",caption = "Source : Kaggle") +
  theme_bw()  +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

Plot2
saveRDS(Plot2,"Plot2.rds")


Plot3 <- ggplot(df1, aes(x = Industry, y = Percentage)) +
  geom_boxplot(fill = "lightblue", color = "blue", alpha = 0.7) +  
  labs(title = "Distribution of Percentage by Industry",
       x = "Industry",
       y = "Percentage",caption = "Source : Kaggle") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.background = element_rect(fill = "white"))
Plot3
saveRDS(Plot3,"Plot3.rds")


Plot4 <- ggplot(df1, aes(x = Company_Size_before_Layoffs, y = Money_Raised_in_mil)) +
  geom_point(color = "green", size = 3, shape = 16) +  # Customize point aesthetics
  labs(title = "Relationship between Company Size Before Layoffs and Money Raised",
       x = "Company Size Before Layoffs",
       y = "Money Raised (in million)",caption = "Source : Kaggle")

Plot4 <- Plot4 + theme_minimal()
Plot4 <- Plot4 + scale_x_continuous(labels = scales::number_format(scale = 1e-0))
Plot4
saveRDS(Plot4,"Plot4.rds")

Plot5 <- ggplot(df1, aes(x = Company_Size_after_layoffs, y = Money_Raised_in_mil, color = Industry)) +
  geom_point(size = 3, shape = 16) +  
  labs(title = "Relationship between Company Size and Money Raised",
       subtitle = "after Layoffs",  
       x = "Company Size after Layoffs",
       y = "Money Raised (in million)",caption = "Source : Kaggle") +
  theme_minimal()
Plot5 <- Plot5 + scale_x_continuous(labels = scales::number_format(scale = 1e-0))
Plot5
saveRDS(Plot5,"Plot5.rds")

Plot6 = ggplot() +
  borders("world", colour = "gray50", fill = "gray50") +
  geom_point(data = df1, aes(x = lng, y = lat, size = Laid_Off, color = Industry), alpha = 0.7) +
  scale_size_continuous(name = "Laid Off", labels = scales::comma) +
  scale_color_manual(name = "Industry", values = c("Consumer" = "blue", "Other" = "green")) +
  labs(title = "Map Plot of Company Headquarters",
       subtitle = "Laid Off Employees by Industry",
       x = "Longitude", y = "Latitude", caption = "Source : Kaggle") +
  theme(legend.position = "right")
Plot6
saveRDS(Plot6,"Plot6.rds")

Plot7 = ggplot() +
  borders("world", colour = "gray50", fill = "gray50") +
  geom_point(data = df1, aes(x = lng, y = lat, size = Money_Raised_in_mil, color = Continent), alpha = 0.7) +
  scale_size_continuous(name = "Money Raised (in mil)", labels = scales::comma) +
  scale_color_manual(name = "Continent", values = c("Asia" = "blue", "Other" = "green")) +
  labs(title = "Map Plot of Company Headquarters",
       subtitle = "Money Raised by Companies across Continents",
       x = "Longitude", y = "Latitude",caption = "Source : Kaggle") +
  theme(legend.position = "right")
Plot7
saveRDS(Plot7,"Plot7.rds")
