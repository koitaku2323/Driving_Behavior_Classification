###################################
### Multinomial Regression - EN ###
###################################

load("~/Github/pstat131FinalProject/RDA/Model_Setup.rda")

set.seed(123)



en_spec <- multinom_reg(mixture = tune(), 
                        penalty = tune()) %>%
  set_mode("classification") %>%
  set_engine("glmnet")

en_workflow <- workflow() %>% 
  add_recipe(data_recipe) %>% 
  add_model(en_spec)

en_grid <- grid_regular(penalty(range = c(0.01, 3), trans = identity_trans()),
                        mixture(range = c(0, 1)),
                        levels = 10)


# Tune Elastic Net Model
en_tune_res <- tune_grid(
  en_workflow,
  resamples = data_folds,
  grid = en_grid
)


collect_metrics(en_tune_res)


best_en <- select_best(en_tune_res)

best_en_data


en_final_data <- finalize_workflow(en_workflow,
                                          best_en_data)

en_final_data <- fit(en_final_data, 
                            data = data_train)



# saving data to load into rmd file
save(best_en, en_tune_res, en_final_data,
     file = "~/Github/pstat131FinalProject/RDA/motion_Multinomial_Regression.rda")
