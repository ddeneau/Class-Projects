import covid_testing as ct

# Tests valid sample quality values to verify they are accepted.
def test_is_valid_sample():
    assert ct.is_valid_sample(1) == True
    assert ct.is_valid_sample(.99) == True
    assert ct.is_valid_sample(.95) == True

# Tests invalid sample quality values to verify they are rejected.
def test_is_not_valid_sample():
    assert ct.is_valid_sample(.94) == False
    assert ct.is_valid_sample(.09) == False
    assert ct.is_valid_sample(0.55) == False

# Tests valid callibration time values to verify they are accepted.
def test_is_valid_callibration():
    assert ct.is_valid_calibration(0) == True
    assert ct.is_valid_calibration(2) == True
    assert ct.is_valid_calibration(4) == True

# Tests invalid callibration time values to verify they are rejected.
def test_is_not_valid_callibration():
    assert ct.is_valid_calibration(5.2) == False
    assert ct.is_valid_calibration(6) == False
    assert ct.is_valid_calibration(7) == False