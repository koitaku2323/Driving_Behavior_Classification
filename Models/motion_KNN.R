###########################
### K-Nearest Neighbors ###
###########################

load("~/Github/pstat131FinalProject/RDA/Model_Setup.rda")

set.seed(123)



# Create a KNN model with k = 5 using the kknn engine
knn_model <- nearest_neighbor(neighbors = tune()) %>%
  set_mode("classification") %>%
  set_engine("kknn")

knn_data_workflow <- workflow() %>%
  add_recipe(data_recipe) %>%
  add_model(knn_model)

neighbors_grid <- grid_regular(neighbors(range = c(1, 10)), levels = 10)


knn_tune_res_data <- tune_grid(
  object = knn_data_workflow, 
  resamples = data_folds, 
  grid = neighbors_grid
)

collect_metrics(knn_tune_res_data)


best_knn_data <- select_by_one_std_err(knn_tune_res_data,
                                       metric = "roc_auc",
                                       neighbors
)
best_knn_data


knn_final_data <- finalize_workflow(knn_data_workflow,
                                    best_knn_data)

knn_final_data <- fit(knn_final_data, 
                      data = data_train)


# saving data to load into rmd file
save(knn_final_data, knn_tune_res_data, 
     file = "~/Github/pstat131FinalProject/RDA/motion_KNN.rda")
