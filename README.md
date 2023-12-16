# Driving Behavior Classification: A Comprehensive Exploration of Predictive Models

## From Random Forest to CNN-LSTM, Unraveling the Layers of Machine Learning for Safer Roads

### Contributors

Ryan Yee

## Abstract

The "Driving Behavior Classification" project presents a comprehensive exploration of predictive models applied to driving behavior data. The journey unfolds with the preprocessing of accelerometer and gyroscope sensor data, followed by the creation and fine-tuning of diverse machine learning models. Seven distinct techniques, including Logistic Regression, K-Nearest Neighbors, Linear Discriminant Analysis, Quadratic Discriminant Analysis, Elastic Net, Multinomial Regression, and Random Forest, are implemented and tested for binary and multiclass classification settings.

The project's focus on model accuracy extends to the evaluation and comparison of these models, paving the way for informed decisions on the optimal model for predicting driving behaviors. Notably, the Random Forest model emerges as the best performer in multiclass classification, showcasing a ROC AUC score of 0.9938.

In a bonus section, the project explores the realm of deep learning with a Convolutional Neural Network-Long Short-Term Memory (CNN-LSTM) model. The CNN-LSTM model is tailored for binary classification, achieving a respectable ROC AUC score of 0.6724 on the testing dataset.

The final comparison between the Random Forest and CNN-LSTM models reveals intriguing insights. While the Random Forest model exhibits a ROC AUC score of 0.5864, the CNN-LSTM model outperforms with a ROC AUC score of 0.6773 on the testing dataset. These results provide valuable perspectives for choosing the most effective model for driving behavior classification.

#### Our Data

The dataset at hand focuses on predicting driving behavior, specifically targeting aggressive driving actions that contribute significantly to road traffic accidents. The data was collected using an Android application designed to utilize the accelerometer and gyroscope sensors on smartphones, with a specific emphasis on a Samsung Galaxy S21 device. The recorded information includes acceleration and rotation data along the X, Y, and Z axes, timestamp information, and classification labels indicating whether the driving behavior is categorized as Slow, Normal, or Aggressive. Noteworthy aspects of the dataset include a sampling rate of 2 samples per second, removal of gravitational acceleration, and the use of sensors for data collection.

You can visit the data set information on Kaggle [here](https://www.kaggle.com/datasets/outofskills/driving-behavior/data).

Response Variable: 

- `Class`: A categorical variable (factor) indicating the driving behavior classification, which includes categories such as SLOW, NORMAL, and AGGRESSIVE.

Predictor Variables:

- `AccX`: A numerical variable representing acceleration along the X-axis in meters per second squared (m/s²).
- `AccY`: A numerical variable representing acceleration along the Y-axis in meters per second squared (m/s²).
- `AccZ`: A numerical variable representing acceleration along the Z-axis in meters per second squared (m/s²).
- `GyroX`: A numerical variable representing rotation along the X-axis in degrees per second (°/s).
- `GyroY`: A numerical variable representing rotation along the Y-axis in degrees per second (°/s).
- `GyroZ`: A numerical variable representing rotation along the Z-axis in degrees per second (°/s).

Variables not used in prediction:

- `Timestamp`: An integer variable representing time in seconds.

## Repository Contents

Structure of this repository:

```         
root directory
├── data
   ├── combined_data.csv
   ├── test_motion.csv
   ├── train_motion.csv
├── Drafts
   ├── pstat131FinalProject.Rmd
├── Images
├── RDA
├── Models
├── Motion-CodeBook.txt
├── Driving_Behavior_Classification.Rmd
├── Driving_Behavior_Classification.html
├── README.md 
└── .gitignore
```
