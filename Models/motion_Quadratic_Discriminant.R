#######################################
### Quadratic Discriminant Analysis ###
#######################################

load("~/Github/pstat131FinalProject/RDA/Model_Setup.rda")

set.seed(123)



# Setup quadratic discriminant model and workflow
qda_model <- discrim_quad() %>% 
  set_mode("classification") %>% 
  set_engine("MASS")

# Create a workflow
qda_workflow <- workflow() %>%
  add_recipe(data_recipe) %>%
  add_model(qda_model)

# Fit the model to the training data
data_qda_fit <- fit(qda_workflow, data = data_train)
predictions_qda <- predict(data_qda_fit, new_data = data_train)


# fitting model to the folds
data_qda_kfold_fit <- fit_resamples(qda_workflow, data_folds, control = control_grid(save_pred = TRUE))
collect_metrics(data_qda_kfold_fit)


# using `augment()` to create a roc curve using our QDA fitted model
data_roc_qda <- augment(data_qda_fit, data_train)



# saving data to load into rmd file
save(data_qda_fit, data_qda_kfold_fit, data_roc_qda, 
     file = "~/Github/pstat131FinalProject/RDA/motion_Quadratic_Discriminant.rda")
