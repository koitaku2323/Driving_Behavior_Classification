############################
### Elastic Net - Binary ###
############################

load("~/Github/pstat131FinalProject/RDA/Model_Setup_Binary.rda")

set.seed(123)


# Elastic Net
data_en_spec <- logistic_reg(mixture = tune(), 
                             penalty = tune()) %>%
  set_mode("classification") %>%
  set_engine("glmnet")

data_en_workflow <- workflow() %>% 
  add_recipe(data_recipe) %>% 
  add_model(data_en_spec)

data_en_grid <- grid_regular(penalty(range = c(0, 1)),
                             mixture(range = c(0, 1)),
                             levels = 10)

en_tune_res_data_binary <- tune_grid(
  data_en_workflow,
  resamples = data_folds, 
  grid = data_en_grid
)

collect_metrics(en_tune_res_data_binary)

best_en_data <- select_best(en_tune_res_data_binary)

best_en_data


en_final_data_binary <- finalize_workflow(data_en_workflow,
                                           best_en_data)

en_final_data_binary <- fit(en_final_data_binary, 
                             data = data_train)


# saving data to load into rmd file
save(en_final_data_binary, en_tune_res_data_binary, 
     file = "~/Github/pstat131FinalProject/RDA/motion_Elastic_Net_Binary.rda")

