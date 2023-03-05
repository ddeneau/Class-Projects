import csv


class Vaccinations:
    """ Stores a collection of vaccination records and returns.
    
    Attributes:
        records (list of VaccinationRecords): A list of VaccinationRecord objects
    """
    def __init__(self):
        ''' Initializes an empty container '''
        self.records = []

    def read_csv(self, csv_file):
        ''' Populates the data for the class from a csv file.
        
        Attributes: 
            csv_file (string): The filename of the file where the data is located.

        Side Effects:
            Modifies records by creating and appending VaccinationRecord objects to it.
        '''
        fh = open(csv_file, 'r', encoding='utf8')
        for row in csv.DictReader(fh):
            date = row['VACCINATION_DATE']
            race = row['RACE_CODE'] 
            first_dose = row['FirstDoseDaily']
            second_dose = row['SecondDoseDaily']
            record = VaccinationRecord(date, race, first_dose, second_dose)
            self.records.append(record)

    def total_records(self):
        ''' Returns the total number of records. '''
        return len(self.records)
    
    def total_anomalous_records(self):
        ''' Return the number of records that have an error in them.'''
        total_anomlous = 0
        for record in self.records:
            if record.is_anomalous:
                total_anomlous = total_anomlous + 1

        return total_anomlous

    def total_by_race(self, race):
        ''' Return the number of records filtered by a given racial category. '''
        total_race = 0
        for record in self.records:
            if record.race == race:
                total_race = total_race + 1
        
        return total_race

    


class VaccinationRecord:
    """ Stores a information about certain dates and to which racial groups vaccines were administered.
    
    Attributes:
        date (string): The date the of the record.
        race (string): The individuals race.
        first_dose (string): The number of first doses given that day.
        second_dose (string): The number of second doses given that day
    """
    def __init__(self, date, race, first_dose, second_dose):
        ''' Initializes a record with a date, race, and numbers of first and second doses
        
        Args:
            date (VaccinationRecord): The date of the record, in day, month, year format.
            race (VaccinationRecord): The race of the people listed in the record.
            first_dose (VaccinationRecord): The number of first doses given.
            second_dose (VaccinationRecord): The number of second doses given.
         '''
        self.date = date
        self.race = race
        self.first_dose = first_dose
        self.second_dose = second_dose

    def is_anomalous(self):
        ''' Returns true if the record is from a date which indicates it is an error  
        or else it returns false. '''
        if self.date < "2020/12/11":
            return True
        else:
            return False
