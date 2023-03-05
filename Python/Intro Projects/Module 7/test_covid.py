from covid import Vaccinations

def test_constructor():
    v = Vaccinations()

def test_read_csv():
    v = Vaccinations()
    v.read_csv('covid-vaccinations.csv')

def test_total_records():
    v = Vaccinations()
    v.read_csv('covid-vaccinations.csv')
    assert v.total_records() >= 672 

def test_total_anomalous_records():
    v = Vaccinations()
    v.read_csv('covid-vaccinations.csv')
    assert v.total_anomalous_records() >= 672

def test_total_by_race():
    v = Vaccinations()
    v.read_csv('covid-vaccinations.csv')
    assert v.total_by_race('White') == 158

