import csv

# Python file that reports which counties have issues in
# Maryland's covid-19 vaccination dataset.
# The final output is a list of counties, sorted in the order
# of doses they reported. Each of these doses is an erroneous report.

# Open the CSV file with MD's covid vaccination dose records by date and county.
md_dataset = open("MD_covid_vac.csv", "r", encoding="utf-8")

# Make the csv file easier to access by mapping data to each row.
reader = csv.DictReader(md_dataset)

# Empty set for counties with records before date of approval. 
error_counties = set()

# Final report container for storage of county names and doses.
report = dict()

# Go through each row of the dataset.
for row in reader:
    if row['VACCINATION_DATE'] < '2020/12/11': # Check for dates before approval date.
        doses_per_day = int(row['DailyFirstDose']) + int(row['DailySecondDose']) # Total doses given that day.
        error_counties.add(row['County']) # Add counties with the error to the error set.
        # If its the first time adding the county, the '+=' won't work 
        # and the code in the except block will add the county using '='
        try:    
            report[row['County']] += doses_per_day # Add following entry to report: 
            # Key -> County Name (Str) 
            # Value -> erroneous doses reported that day (incremented) (Int).
        except KeyError: 
            report[row['County']] = doses_per_day # Add entry to report (if first time adding key to dict)
        
# Using built in sorted() function with the original dict, reverse enabled, and using values, instead of keys, for sorting.
sorted_report = sorted(report, reverse=True, key=report.get)


# Print out results showing which counties have the errors and which do not. 
for k in sorted_report:
    print(str(k) + ',' + str(report[k]))



