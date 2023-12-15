###########################
### Logistic Regression ###
###########################

load("~/Github/pstat131FinalProject/RDA/Model_Setup_Binary.rda")

set.seed(123)



# Specify logistic regression model
logistic_model <- logistic_reg(mode = "classification", engine = "glm")

# Create a workflow
lm_data_workflow <- workflow() %>%
  add_model(logistic_model) %>%
  add_recipe(data_recipe)

lm_fit_val_data <- lm_data_workflow %>% 
  fit_resamples(resamples = data_folds)

data_lm_fit <- fit(lm_data_workflow, data = data_train)

collect_metrics(lm_fit_val_data)

data_roc_lm <- augment(data_lm_fit, data_train)



# saving data to load into rmd file
save(lm_data_workflow, data_roc_lm, data_lm_fit, 
     file = "~/Github/pstat131FinalProject/RDA/motion_Logistic_Regression.rda")
