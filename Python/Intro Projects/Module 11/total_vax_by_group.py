import sqlite3

# Takes in user input asking for a race category to display vaccine data for.
INPUTS = [None, "AMERICAN INDIAN OR ALASKAN NATIVE", "BLACK OR AFRICAN AMERICAN",   # List of categories.
            "ASIAN", "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER", "TWO OR MORE RACES",
            "WHITE"]

COMMAND = ''' 
            SELECT race, first_dose_daily, second_dose_daily FROM vaccinations WHERE race = ? 
          ''' # SQL command used.

DATABASE = 'md-vaccinations.sqlite3' # Database used.

class VaccinesByGroup:
    ''' Takes in user input for a race, and returns the total amount of vaccinations given to that race.'''

    def __init__(self, race):
        self.race = race
        self.connection = None
        self.cursor = None
        self.total = 0
        print(self.race)
        self.run_program()
        
    def connect_to_database(self, database):
        ''' Establish connection to database. '''
        self.connection = sqlite3.connect(database)
        self.cursor = self.connection.cursor()
    
    def execute_select_statement(self):
        '''  Calculate totals. '''
        for row in self.cursor.execute(COMMAND, [self.race]):
            self.total += row[1] + row[2]

        print(self.total)
    
    def run_program(self):
        ''' Connects to the database and returns information to the user.'''
        self.connect_to_database(DATABASE)
        self.execute_select_statement()



usr_in = INPUTS[int(input("x"))]
vbg = VaccinesByGroup(usr_in)


        