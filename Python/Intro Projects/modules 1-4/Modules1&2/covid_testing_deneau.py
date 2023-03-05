def is_valid_sample(sample_quality):
    """
    Returns True if the sample quality is high enough for valid test results
    and, False if it is not.
    """
    if sample_quality >= .9:
        return True
    else:
        return False

def is_valid_calibration(calibration_time):
    """
    Returns True if the calibration time is low enough for valid results, and
    False if it is not.
    """
    if calibration_time < 5:
        return True
    else:
        return False

def main():
    total_tests = 0
    total_valid_tests = 0
    positive_tests = 0
    test_result = False

    #q1:
    # checks if sample quality is good OR calibration time is valid 
    # should be and.

    # Does not check for test_result to be true to add one to postive test.

    # total tests is incremented before checking if the sample is valid.

    # you can press some key besides Y or N and it will register a true postive result.

    # Program terminates if you input a wrong data type by accident.
    # Could use exception handling.

    # quality q should probably not be able to be a number like 10, but rather between 1 and 0.

    while True:
        answer = input("Test positive? [y,n or stop]: ")
        if answer == "stop":
            break
        elif answer == "y":
            test_result = True
        elif answer == "n":
            test_result = False
        else:
            break

        q = float(input("Sample quality: "))
        t = int(input("Minutes since last calibration: "))
        a = int(input("Patient age: "))
        g = input("Patient gender: ")
        z = input("Patient zip code: ")
        r = input("Patient race: ")

        total_tests += 1

        if is_valid_sample(q) and is_valid_calibration(t):
            total_valid_tests += 1
            
            if test_result:
                positive_tests += 1

    print()
    print("Total tests: ", total_tests)
    print("Valid tests:  ", total_valid_tests)
    print("Positive: ", positive_tests)
    print("Negative: ", total_valid_tests - positive_tests)
    print("Invalid:", total_tests - total_valid_tests)

main()


#q2: The best way to collect demographic information in this program would be to create variables in the scoop 
#    of the main while loop. For example, have an age and ask for an integer and have the user type in
#    their age, but that would lead to the problem of people typing in things that were not valid for strings. There could be exception handling to fix this.
#    A problem that could come up would the storage and output of the demographic information. But you could do that by creating a data structure outside of the main loop
#    to store recorded entries during the loop.