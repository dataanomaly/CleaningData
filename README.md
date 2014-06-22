### Introduction

The purpose of this script is to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

The data has been collected from the accelerometers in the Samsung Galaxy S smartphone as described in
the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


### Purpose of the Script

    The R script run_analysis.R that does the following. 

    1) Merges the training and the test sets to create one data set.
    2) Extracts only the measurements on the mean and standard deviation for each measurement. 
    3) Uses descriptive activity names to name the activities in the data set
    4) Appropriately labels the data set with descriptive variable names. 
    5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

In order to run the script, you must do the following:

1.  Unzip the UCI HAR Dataset and place the activity_labels.txt, features.txt,
    subject_test.txt, subject_train.txt, X_test.txt, X_train.txt, y_test.txt
    and y_train.txt files in the working directory along with the
    run_analysis.R script.
2.  Running the script will create the tidy data set called tidy.txt.
    edit the files locally on your own machine.
3.  Edit the R file contained in the git repository and place your
    solution in that file (please do not rename the file).
4.  Commit your completed R file into YOUR git repository and push your
    git branch to the GitHub repository under your account.
5.  Submit to Coursera the URL to your GitHub repository that contains
    the completed R code for the assignment.
