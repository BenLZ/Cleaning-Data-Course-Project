# Code Book for cleaning the data provided (see README.md for more info on data set)

This code book refers to varaibles and data present in CleanData.txt, which is a text file containing values separated by " ".

The first row contains the names of the variables, and the first two columns provide information about the subject/activity being analyzed.

## Variables

"Subject_Number" refers to the person being analyzed, which ranges from 1-30.

"Activity_Name" descriptively refers to the type of activity being performed for the given measurements.

Information regarding how the measurements were taken and transformed can be found in the link within the README.md file.

"timeDomainBodyAccelerometer..." gives the average mean and standard deviation of time-domain body acceleration in the X, Y, and Z directions.

"timeDomainGravityAccelerometer..." gives the average mean and standard deviation of the time-domain gravity acceleration in the X, Y, and Z directions.

"timeDomainBodyAccelerometerJerk..." gives the average mean and standard deviation fo the time-domain body acceleration jerk in the X, Y, and Z directions.

"timeDomainBodyGyroscope..." gives the average mean and standard deviation of the time-domain angular velocity in the X, Y, and Z directions.

"timeDomainBodyGyroscopeJerk..." gives the average mean and standard deviation of the time-domain angular velocity jerk in the X, Y, and Z directions.

"timeDomainBodyAccelerometerMagnitude..." gives the average mean and standard deviation of the time-domain magnitude of body acceleration.

"timeDomainGravityAccelerometerMagnitude..." gives the average mean and standard deviation of the time-domain magnitude of gravity acceleration.

"timeDomainBodyAccelerometerJerkMagnitude..." gives the average mean and standard deviation of the time-domain magnitude of body acceleration jerk.

"timeDomainBodyGyroscopeMagnitude..." gives the average mean and standard deviation of the time-domain magnitude of body angular velocity.

"timeDomainBodyGyroscopeJerkMagnitude..." gives the average mean and standard deviation of the time-domain magnitude of body angular velocity jerk.

"frequencyDomainBodyAccelerometer..." gives the average mean and standard deviation of frequency-domain body acceleration in the X, Y, and Z directions.

"frequencyDomainBodyAccelerometerMeanFrequency..." gives the weighted average of the mean of frequency-domain body acceleration in the X, Y, and Z directions.

"frequencyDomainBodyAccelerometerJerk..." gives the mean and standard deviation of the mean of frequency-domain body acceleration jerk in the X, Y, and Z directions.

"frequencyDomainBodyAccelerometerJerkMeanFrequency..." the weighted average of the mean of frequency-domain body acceleration jerk in the X, Y, and Z directions.

"frequencyDomainBodyGyroscope..." gives the average mean and standard deviation of the frequency-domain angular velocity in the X, Y, and Z directions.

"frequencyDomainBodyGyroscopeMeanFrequency..." gives the weighted average of the mean of the frequency-domain angular velocity in the X, Y, and Z directions.

"frequencyDomainBodyAccelerometerMagnitude..." gives the mean, standard deviation, and frequency of the frequency parts of the frequency-domain magnitude of body acceleration.

"frequencyDomainBodyAccelerometerJerkMagnitude..." gives the mean, standard deviation, and frequency of the frequency parts of the frequency-domain magnitude of body acceleration jerk.

"frequencyDomainBodyGyroscopeMagnitude..." gives the mean, standard deviation, and frequency of the frequency parts of the frequency-domain magnitude of body angular velocity.

"frequencyDomainBodyGyroscopeJerkMagnitude..." gives the mean, standard deviation, and frequency of the frequency parts of the frequency-domain magnitude of body angular velocity jerk.

## Transformations

1. Data obtained from zip file within README.md.
2. Data were read in R.
3. Training and Test sets were merged into one data set.
4. Columns were given names based on features.txt file.
5. Only data contained "mean" and "std" labels were extracted into new data set.
6. Activity names were given descriptive names based on activity_labels.txt file.
7. Column names were extracted and tidied with more descriptive features.
8. Column names were reassigned to the data set.
9. totalDataMeans data set was produced containing only the mean of each variable for each subject/activity.
10. CleanData.txt file was produced containing the totalDataMeans set.
