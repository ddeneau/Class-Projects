#  Module 4 Assignment
# Daniel Deneau

# Stores information about individual covid tests and evaluates their validity.
class CovidTestResult():
    """ Stores information about a individual covid test.
    
    Attributes:
        sample_quality (float): the quality (0-1) of the sample used in the
        covid test.
        last_calibration (integer): the time in hours since the last
        calibration of the test device and method.
    """
    # Constructor
    def __init__(self, sample_quality, last_calibration):
        """ Initialize new CovidTestResult object.

        Args:
            sample_quality (CovidTestResult): quality of the test sample.
            last_calibration (CovidTestResult): hours since last calibration of the test.

        Side effects:
           Sets sample_quality and last_calibration to the respective arugments passed in.
        """
        self.sample_quality = sample_quality
        self.last_calibration = last_calibration
    
    # Checks for sample validity.
    def is_valid(self):
        """ Checks sample_quality and last_calibration agaisnt thresholds 
        for validity of test sample.

        Side effects: Returns true if sample is valid (valid quality and time), or else false
        meaning the sample is invalid. Writes to the console when a bad value is encountered.
        """
        if self.sample_quality <= 0.95:
            print("Invalid Sample Quality")
            return False
        if self.last_calibration > 5:
            print("Invalid Time Since Last Calibration")
            return False
        else:
            return True