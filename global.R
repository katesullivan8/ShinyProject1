library(shiny)
library(dplyr)
library(googleVis)
library(DT)
library(shinydashboard)
library(rsconnect)



states_all = read.csv("us-education-datasets-unification-project/states_all.csv", header = TRUE, stringsAsFactors = FALSE )
finance_dist = read.csv("us-education-datasets-unification-project/Aggregates/finance_districts.csv", header = TRUE, stringsAsFactors = FALSE)
finance_states = read.csv("us-education-datasets-unification-project/Aggregates/finance_states.csv", header = TRUE, stringsAsFactors = FALSE)
names(states_all) = tolower(names(states_all))


scores_time = select(states_all, year, state, math_avg = avg_math_8_score, 
                     lit_avg = avg_reading_8_score, 
                     total_exp = total_expenditure, enroll) %>% 
  mutate(., math_avg = round(math_avg,2), lit_avg=round(math_avg, 2), per_student_cost = round(total_exp/enroll, 2)) %>% 
  select(., year, state, math_avg, lit_avg, per_student_cost) %>% 
  group_by(., state, year) %>% 
  arrange(., desc(year))
scores_time = na.omit(scores_time)


rownames(scores_time) <- NULL
scores_expense = select(states_all, year, state, total_exp = total_expenditure, support_cost=support_services_expenditure, instruction_cost=instruction_expenditure, math_avg = avg_math_8_score, read_avg = avg_reading_8_score) %>%
  filter(year>2010) %>% 
  group_by(., state, year) %>% 
  arrange(., desc(year))
scores_expense = na.omit(scores_expense)

scores_expense
choice <- colnames(scores_time)[3:5]
choice
summary(scores_time)
