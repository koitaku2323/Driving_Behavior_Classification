#######################################
### Linear Discriminant Analysis ###
#######################################

load("~/Github/pstat131FinalProject/RDA/Model_Setup.rda")

set.seed(123)



# Setup linear discriminant model and workflow
lda_model <- discrim_linear() %>% 
  set_mode("classification") %>% 
  set_engine("MASS")

# Create a workflow
lda_workflow <- workflow() %>%
  add_recipe(data_recipe) %>%
  add_model(lda_model)

# Fit the model to the training data
data_lda_fit <- fit(lda_workflow, data = data_train)
predictions_lda <- predict(data_lda_fit, new_data = data_train)


# fitting model to the folds
data_lda_kfold_fit <- fit_resamples(lda_workflow, data_folds, control = control_grid(save_pred = TRUE))
collect_metrics(data_lda_kfold_fit)


# using `augment()` to create a roc curve using our QDA fitted model
data_roc_lda <- augment(data_lda_fit, data_train)



# saving data to load into rmd file
save(data_lda_fit, data_lda_kfold_fit, data_roc_lda, 
     file = "~/Github/pstat131FinalProject/RDA/motion_Linear_Discriminant.rda")
