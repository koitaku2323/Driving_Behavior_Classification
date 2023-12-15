#####################
### Random Forest ###
#####################

load("~/Github/pstat131FinalProject/RDA/Model_Setup.rda")

set.seed(123)



rf_class_spec <- rand_forest(mtry = tune(), 
                             trees = tune(), 
                             min_n = tune()) %>%
  set_engine("ranger", importance = "impurity") %>% 
  set_mode("classification")

rf_class_wf <- workflow() %>% 
  add_model(rf_class_spec) %>% 
  add_recipe(data_recipe)


rf_grid <- grid_regular(mtry(range = c(1, 6)), 
                        trees(range = c(200, 600)),
                        min_n(range = c(10, 20)),
                        levels = 6)
rf_grid

# Tune Random Forest Model
tune_class <- tune_grid(
  rf_class_wf,
  resamples = data_folds,
  grid = rf_grid
)


collect_metrics(tune_class)


best_rf_class <- select_best(tune_class)


# saving data to load into rmd file
save(best_rf_class, tune_class, 
     file = "~/Github/pstat131FinalProject/RDA/motion_Random_Forest")

# Since it takes 2 hours to run,
# the previous version model is saved in RDA folder as tune_class.rda