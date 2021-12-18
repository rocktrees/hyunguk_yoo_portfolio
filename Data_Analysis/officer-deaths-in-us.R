# importing excel file
# setwd("C:/Users/Alondra/Documents/School/Spring 2020/STAT 3355/Project Stuffs")
police.deaths <- read.csv("newdata.csv.txt")

# removing redundant columns
police.deaths <- police.deaths[-2]
police.deaths <- police.deaths[-3]

# changing eow to day-of-death
police.deaths$'eow' <- substr(police.deaths$'eow', 6, 8)
names(police.deaths)[names(police.deaths) == 'eow'] <- 'day' 

# shortening date to just be months
police.deaths$'date' <- substr(police.deaths$'date', 6, 7)
names(police.deaths)[names(police.deaths) == 'date'] <- 'month'

# changing police.deaths$day to ordered factor variable
police.deaths$'day' <- as.factor(police.deaths$'day')
police.deaths$'day' <- ordered(police.deaths$'day',
                             levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))

# changing police.deaths$months to ordered factor variable
police.deaths$'month' <- as.factor(police.deaths$'month')
levels(police.deaths$month) <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

# making vectors
#jobs <- levels(police.deaths$position)
acting_chief <- which(police.deaths$position == "Acting Chief")
boatman <- which(police.deaths$position == "Boatman")
chief_of_police <- which(police.deaths$position == "Chief of Police")
constable <- which(police.deaths$position == "Constable")
customs_officers <- which(police.deaths$position == "Customs Officers")
detective <- which(police.deaths$position == "Detective")
head_attendant <- which(police.deaths$position == "Head Attendant")
k9 <- which(police.deaths$position == "K9")
marshal <- which(police.deaths$position == "Marshal")
pilot <- which(police.deaths$position == "Pilot")
private <- which(police.deaths$position == "Private")
sergeant <- which(police.deaths$position == "Sergeant")
technician <- which(police.deaths$position == "Technician")
youth_counselor <- which(police.deaths$position == "Youth Counselor")
administrator <- which(police.deaths$position == "Administrator")
cadet <- which(police.deaths$position == "Cadet")
clerk<- which(police.deaths$position == "Clerk")
coordinator <- which(police.deaths$position == "Coordinator")
department_director <- which(police.deaths$position == "Department Director")
dispatcher <- which(police.deaths$position == "Dispatcher")
inspector <- which(police.deaths$position == "Inspector")
keeper <- which(police.deaths$position == "Keeper")
mayor <- which(police.deaths$position == "Mayor")
police_officer <- which(police.deaths$position == "Police Officer")
probation_officer <- which(police.deaths$position == "Probation Officer")
sheriff <- which(police.deaths$position == "Sheriff")
trooper <- which(police.deaths$position == "Trooper")
agent <- which(police.deaths$position == "Agent")
captain <- which(police.deaths$position == "Captain")
coroner <- which(police.deaths$position == "Coroner")
department_supervisor <- which(police.deaths$position == "Department Supervisor")
district_attorney <- which(police.deaths$position == "District Attorney")
investigator <- which(police.deaths$position == "Investigator")
lieutenant <- which(police.deaths$position == "Lieutenant")
operative <- which(police.deaths$position == "Operative")
police_seurgon <- which(police.deaths$position == "Police Seurgon")
ranger <- which(police.deaths$position == "Ranger")
special_agent <- which(police.deaths$position == "Special Agent")
turnkey <- which(police.deaths$position == "Turnkey")
bailiff <- which(police.deaths$position == "Bailiff")
chaplain <- which(police.deaths$position == "Chaplain")
comissioner <- which(police.deaths$position == "Comissioner")
corporal <- which(police.deaths$position == "Corporal")
deputized_civilian <- which(police.deaths$position == "Deputized Civilian")
game_protector <- which(police.deaths$position == "Game Protector")
jailer <- which(police.deaths$position == "Jailer")
major <- which(police.deaths$position == "Major")
park_ranger <- which(police.deaths$position == "Park Ranger")
polygraph_operator <- which(police.deaths$position == "Polygraph Operator")
reserve_police_officer <- which(police.deaths$position == "Reserve Police Officer")
superintendent <- which(police.deaths$position == "Superintendent")
warden <- which(police.deaths$position == "Warden")
biologist <- which(police.deaths$position == "Biologist")
chief_deputy <- which(police.deaths$position == "Chief Deputy")
commander <- which(police.deaths$position == "Commander")
correctional_officer <- which(police.deaths$position == "Correctional Officer")
deputy <- which(police.deaths$position == "Deputy")
guard <- which(police.deaths$position == "Guard")
justice_of_the_peace <- which(police.deaths$position == "Justice of the Peace")
manager <- which(police.deaths$position == "Manager")
patrolman <- which(police.deaths$position == "Patrolman")
posseman <- which(police.deaths$position == "Posseman")
school_officer <- which(police.deaths$position == "School Officer")
surgeon <- which(police.deaths$position == "Surgeon")
watchman <- which(police.deaths$position == "Watchman")

death_plot <- plot(police.deaths$position, main = "# of deaths per position", ylab = "# of deaths", 
                   xlab = "Jobs" ,cex.names = .5, las = 2)


a <- length(acting_chief)
b <- length(boatman)
c <- length(chief_of_police)
d <- length(constable)
e <- length(customs_officers)
f <- length(detective)
g <- length(head_attendant)
h <- length(k9)
i <- length(marshal)
j <- length(pilot)
k <- length(private)
l <- length(sergeant)
m <- length(technician)
n <- length(youth_counselor)
o <- length(administrator)
p <- length(cadet)
q <- length(clerk)
r <- length(coordinator)
s <- length(department_director)
t <- length(dispatcher)
u <- legnth(inspector)
v <- length(keeper)
w <- length(mayor)
x <- length(police_officer)
y <- length(probation_officer)
z <- length(sheriff)
aa <- length(trooper)
bb <- length(agent)
cc <- length(captain)
dd <- length(coroner)
ee <- length(department_supervisor)
ff <- length(district_attorney)
gg <- length(investigator)
hh <- length(lieutenant)
ii <- length(operative)
jj <- length(police_seurgon)
kk <- length(ranger)
ll <- length(special_agent)
mm <- length(turnkey)
nn <- length(bailiff)
oo <- length(chaplain)
pp <- length(comissioner)
qq <- length(corporal)
rr <- length(deputized_civilian)
ss <- length(game_protector)
tt <- length(jailer)
uu <- length(major)
vv <- length(park_ranger)
ww <- length(polygraph_operator)
xx <- length(reserve_police_officer)
yy <- length(superintendent)
zz <- length(warden)
aaa <- length(biologist)
bbb <- length(chief_deputy)
ccc <- length(commander)
ddd <- length(correctional_officer)
eee <- length(deputy)
fff <- length(guard)
ggg <- length(justice_of_the_peace)
hhh <- length(manager)
iii <- length(patrolman)
jjj <- length(posseman)
kkk <- length(school_officer)
lll <- length(surgeon)
mmm <- length(watchman)


# Pie graph of top 5 causes of canine death in America
# making subsets 
canine_death <- which(police.deaths$canine == T)
cause_canine_death <- police.deaths$cause_short[canine_death]

# make vector into data table
ccd <- table(cause_canine_death)

# make vector of top 5 deathiest states
top5cause <- ccd[rev(order(ccd))][1:5]
# find out the top 5 causes of death from this graph
barplot(top5cause, main = "Top 5 causes of canine death", xlab = "States", ylab = "Deaths", cex.names = .8)

# # of dogs that died by the top 5 causes
gun <- length(which(police.deaths$cause_short[canine_death] == "Gunfire"))
heat <- length(which(police.deaths$cause_short[canine_death] == "Heat exhaustion"))
car <- length(which(police.deaths$cause_short[canine_death] == "Struck by vehicle"))
stabbed <- length(which(police.deaths$cause_short[canine_death] == "Stabbed"))
fall <- length(which(police.deaths$cause_short[canine_death] == "Fall"))

# making the pie chart
slices <- c(gun, heat, car, stabbed, fall)
lbls <- c("Gunfire", "Heat exhaustion", "Stuck by vehicle", "Stabbed", "Fall")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 

# getting nice colors
install.packages("RColorBrewer")
library(RColorBrewer)

# pie chart
pie(slices, labels = lbls, main = "Top 5 causes of canine death in the police force in America", 
    col = brewer.pal(5,'Set3'), cex = 1.2)



# finds top 5 deadliest states
# making subsets
states_canine_death <- police.deaths$state[canine_death]
scd <- table(states_canine_death)

# finding top 5 deathliest states
top5states <- scd[rev(order(scd))][1:5]
# barlplot showing top 5 deathliest states
barplot(top5states, main = "Top 5 deadliest states in America for canines", xlab = "States", ylab = "Deaths", col = brewer.pal(5,'Set3'))




# find 
canine_death <- which(police.deaths$canine == T)
police.deaths$cause_short[canine_death]

ca <- which(police.deaths$state[canine_death] == " CA")
fl <- which(police.deaths$state[canine_death] == " FL")
az <- which(police.deaths$state[canine_death] == " AZ")
va <- which(police.deaths$state[canine_death] == " VA")
tx <- which(police.deaths$state[canine_death] == " TX")

deaths_by_state <- c(ca, fl, az, va, tx)

barplot(deaths_by_state, names.arg = c("CA", "FL", "AZ", "VA", "TX"))

states <- filter(police.deaths, state == c("CA", "FL", "AZ", "VA", "TX"))
deaths_per_state <- filter(states, position == "K9")




