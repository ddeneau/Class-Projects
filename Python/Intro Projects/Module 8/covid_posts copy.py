import csv
import re
from typing import Dict
# Finds the most popular posts about related to the 2019 coronavirus on Reddit.com
# using a dataset collected with the PushShift API.
FILENAME = 'reddit.csv' # Filename of the with data stored.
COVID_PATTERN = r'covid[19]?|coronavirus'

class Posts:
    """ Stores a collection of posts 

    Attributes:
        post_list (list): list of all post objects with the title, url, and number of comments.
        post_dict (dictionary): dictionary of posts with title as keys, and number of comments as values.
    
    """
    def __init__(self):
        self.post_list = []
        self.post_dict = dict()
    
    def read_posts(self, filename, pattern):
        """ Turns the posts from the csv file into post objects
        
        Args:
            filename (string) : name of the file where the data is located.
            pattern (regular expression) : the pattern you want to match post title and selftext to.
        
        Side Effects:
            Adds objects to the post list.
            Adds objects to the post dictionary.

        . """
        with open(filename, 'r') as file_reader:
            for line in csv.DictReader(file_reader):
                title_match = re.search(pattern, line['title'], flags=re.IGNORECASE) # Matches title for covid keywords.
                post_text_match = re.search(pattern, line['selftext'], flags=re.IGNORECASE) # Matches post text for covid keywords 
                if title_match or post_text_match:
                    post = RedditPost(line['title'], line['url'], int(line['num_comments']))
                    self.post_list.append(post) # Create and add a new post object to the list.
                    self.post_dict[post] = int(line['num_comments'])

    def print_popular_post(self):
        """ Prints out the top post (the post with the most comments)."""
        sorted_posts = sorted(self.post_dict)
        top_post = sorted_posts.pop()
        print(top_post)

        

    def print_posts(self):
        """ Prints out all the posts. """
        for post in self.post_list:
            print(post.__str__())
    


class RedditPost:
    """ Stores metadata about a reddit post """

    def __init__(self, title, post_url, number_of_comments):
        self.title = title
        self.post_url = post_url
        self.number_of_comments = number_of_comments
    
    def __str__(self):
        """ Prints out the data for the object in readable form.  """
        return "Title: " + self.title +  "\nUrl: " + self.post_url + "\nNumber of Comments: " + str(self.number_of_comments)
    
    def __gt__(self, other):
        """ Compares posts by number of comments.
        Args: 
            other (RedditPost) : The other post being compared. 
        """
        return self.number_of_comments > other.number_of_comments

    def __lt__(self, other):
        """ Compares posts by number of comments.
        Args: 
            other (RedditPost) : The other post being compared.
        """
        return self.number_of_comments < other.number_of_comments


if __name__ == '__main__':
    p = Posts()
    p.read_posts(FILENAME, COVID_PATTERN)
    p.print_popular_post()