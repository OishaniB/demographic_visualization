###############################################################
# 02- Data Visualization in R (Example Dataset)
# Author: Oishani Bhattacharya
# Purpose: Demonstrate basic R visualizations and EDA
###############################################################

# Load necessary package for reading Excel files
library(readxl)

# Import dataset from local directory
# This dataset includes demographic variables and car purchase details
df=read_excel("data/DV Dataset.xlsx")

# Reload dataset after setting working directory
df=read_excel("DV Dataset.xlsx")

# Inspect the structure of the dataset
str(df)

# Generate basic summary statistics
summary(df)

# Preview the first few rows
head(df)

###############################################################
# Exploratory Data Analysis (EDA)
###############################################################

# Histogram of Age
hist(df$Age,
     main = "Age Distribution",
     xlab = "Age",
     col = "lightblue",
     border = "white")

# Histogram of Income
hist(df$Income,
     main = "Income Distribution",
     xlab = "Income ($k)",
     col = "lightgreen")

# Scatterplot of Income vs Car Price
plot(df$Income, df$`Car Price`,
     xlab = "Income",
     ylab = "Car Price",
     main = "Income vs Car Price",
     pch = 19,
     col = "darkblue")

# Barplot showing Gender distribution
barplot(table(df$Gender),
        main = "Gender Distribution",
        col = c("pink", "lightblue"))

# Barplot showing Car Price Category distribution
barplot(table(df$`Car Price Category`),
        main = "Car Price Category",
        col = "orange")

###############################################################
# Comparative Visualizations
###############################################################

# Boxplot of Car Price by Gender
boxplot(`Car Price` ~ Gender, data = df,
        main = "Car Price by Gender",
        xlab = "Gender",
        ylab = "Car Price",
        col = c("pink", "lightblue"))

# Boxplot of Income across Education Levels
boxplot(Income ~ Education, data = df,
        main = "Income by Education Level",
        xlab = "Education Level",
        ylab = "Income")

###############################################################
# ggplot2 Visualization
###############################################################

library(ggplot2)

# Scatterplot with ggplot: Income vs Car Price, coloured by Gender
ggplot(df, aes(x = Income, y = `Car Price`, color = Gender)) +
  geom_point(size = 3) +
  labs(title = "Income vs Car Price",
       x = "Income",
       y = "Car Price")