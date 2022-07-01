# To investigate the trip duration for female and male bikers
#reading the data

ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

# To investigate the trip duration for female and male riders
#reading the data

nyy = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')
library(ggplot2)

#Looking through the data
head(nyy)
ny = subset(nyy, Gender !='')
#A peek into the demographics i.e. how many male bikers do we have, which gender has more bikers
table(ny$Gender)

# Which gender has long ride durations 
#note: the duration is now measured in minutes i.e. we divided by 60
by(ny$Trip.Duration/60, ny$Gender, summary)

#Using a boxplot
qplot(x=Gender, y=Trip.Duration/60, 
      data= ny, 
      geom= 'boxplot',
      main = 'Box Plot of Gender versus Trip Duration in New York') +
      coord_cartesian(ylim=c(0,50)) +
      ylab('Trip Duration in minutes')

chi = read.csv('chicago.csv')
library(ggplot2)

#Looking through the data
head(chi)

# Remove null values
chii = subset(chi, Gender !='')
#A peek into the demographics i.e. how many male bikers do we have, which gender has more bikers
table(chii$Gender)

#Which gender has long ride durations note: the duration is now measured in minutes since we divided by 60
by(chii$Trip.Duration/60, chii$Gender, summary)

#Using a boxplot
qplot(x=Gender, y=Trip.Duration/60, 
      data= chii, 
      geom= 'boxplot', 
      main = 'Box Plot of Gender versus Trip Duration in Chicago') + 
      coord_cartesian(ylim=c(0,50))  +
      ylab('Trip Duration in Minutes')
      

#looking Through the data
head(ny)
#Getting the total of bikers in the city
dim(ny)[1]

#Getting the total by Gender
table(ny$Gender)

# Since summary() sorts the result in Ascending order, 
# Filter out the first 5 result using Indexing

summary(ny$Start.Station)[1:5]

# looking Through the data
head(chi)

#Getting the total of bikers in the city
dim(chi)[1]

# Getting the total by Gender
table(chi$Gender)

# Since summary() sorts the result in Ascending order, I Used index to filter out the first 5
summary(chi$Start.Station)[1:5]

##looking through the data
head(wash)
#Getting the total of bikers in the city
dim(wash)[1]


#Getting the total by Gender

# Since summary() sorts the result in Ascending order
#Filter out the first 5 result using Indexing

summary(wash$Start.Station)[1:5]

#looking through the data
head(ny)

#Creating a summary table for user type versus gender
table(ny$User.Type, ny$Gender)
tableprop = as.table(table(ny$User.Type, ny$Gender))
prop.table(tableprop)


#Plotting a bar chart of usertype versus count faceting on Gender
ggplot(ny, aes(x=factor(User.Type)))+
  geom_bar(stat="count", width=0.7, fill="#efdd6f")+
  theme_minimal()  +
  labs(title= 'Bar Chart of Usertype Spilt on Gender for New York City', x='User Type', y='Count') +
  facet_wrap(~Gender)


#looking through the data
head(chi)

#Creating a summary table for user type versus gender
table(chi$User.Type, chi$Gender)
tableprop = as.table(table(chi$User.Type, chi$Gender))
prop.table(tableprop)

#Plotting a bar chart of usertype versus count faceting on Gender
ggplot(chi, aes(x=factor(User.Type)))+
  geom_bar(stat="count", width=0.7, fill="#800000")+
  theme_minimal()  +
  labs(title= 'Bar Chart of Usertype Spilt on Gender for Chicago', x='User Type', y='Count') +
  facet_wrap(~Gender)

#looking through the data
head(wash)

#Creating a summary table for user type versus gender
table(wash$User.Type)
tableprop = as.table(table(wash$User.Type))
prop.table(tableprop)


#Plotting a bar chart of usertype versus count
ggplot(wash, aes(x=factor(User.Type)))+
  geom_bar(stat="count", width=0.7, fill="#ff00ff")+
  theme_minimal()  +
  labs(title= 'Bar Chart of Usertype Washington', x='User Type', y='Count')

#The data given for Washington does not contain gender, hence we can't spilt on gender

system('python -m nbconvert Explore_bikeshare_data.ipynb')
