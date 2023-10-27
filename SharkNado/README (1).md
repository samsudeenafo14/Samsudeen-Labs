SHARKNADO

This README provides an overview of the data cleaning a steps performed on the dataset with the aim of preparing it for further analysis and modeling.


Data Cleaning Methods


Handling Missing Values
  Addressed missing values in the dataset.
  Explored the dataset's shape to ensure all missing values were removed.


Column Cleaning: Activity
  Unified similar activities into broader categories.
  Identified and updated activities related to 'COUN,' 'SWIMMING,' 'FISHING,' 'DIVING,' and 'SHALLOW WATER.'


Column Cleaning: Injury
  Unified similar injury descriptions into broader categories.
  Combined injuries related to 'FATAL' and 'DEATH' into 'FATAL.'
  Created a binary column 'Injury_binary' (1 for fatal injuries, 0 for non-fatal injuries).

The data Cleaning helped us eliminate inconsistencies,errors and inaccuracies making it concise and easier to work with^.


Final Dataset
The resulting dataset is now ready for further analysis and modeling. It consists of the following columns:
 'Country'
 'Type'
 'State'
 'Activity'
 'Injury'
 'Type_binary' (1 for fatal injuries, 0 for non-fatal injuries)
 'Injury_binary' (1 for fatal injuries, 0 for non-fatal injuries).


Usage
The clean dataset is suitable for various data analysis and modeling tasks. It has no missing values, and its categorical columns have been processed for further analysis.

