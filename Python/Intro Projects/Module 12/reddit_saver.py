import requests
import json

# Assignment: write a Python program that will prompt you for a search query
# for example COVID19, and will then search for UMD subreddit submissions 
# that match that query and save the data to a JSON file..

class RedditDataSaver:
    """ Saves a JSON file of reddit data based on a user search.

    search_query (str) - 
    sub_reddit (str) -
    data_dump () - 

    """

    def __init__(self, search_query, sub_reddit='UMD'):
        self.search_query = search_query
        self.data_dump = list()
        self.data_dump_d = dict()
        self.sub_reddit = sub_reddit


    def change_search_terms(self, new_query):
        """ Changes the query that is used for the data retrieval. 
            
            new_query (str) -
            """
        self.search_query = new_query


    def access_reddit_data(self):
        """ Establishes the connection to retrieve data from the website
            
            Assigns the variable data_dump the actual data from reddit. """

        url = f'https://api.pushshift.io/reddit/search/submission/?qtitle={self.search_query}&subreddit={self.sub_reddit}'
        req = requests.get(url)
        self.data_dump = req.json()

    
    def save_file(self, filename):
        """ Saves the data dump to a JSON file. 
            
            filename (str) - the name of the file """

        file_handler = open(f'{filename}.JSON', 'w') # This seems confusing. Maybe it would be better to have the user type the file extension themselves?
        json.dump(self.data_dump, file_handler)
    

    def print_data(self):
        """ Prints post titles to the console (for testing) """
        for post in self.data_dump['data']:
            print(post['title'])




def test_reddit_saver_class():
    reddit_search = RedditDataSaver('COVID19') # Professor, can you use a regex here?
    reddit_search.access_reddit_data()
    reddit_search.save_file('results')


test_reddit_saver_class()
    
    