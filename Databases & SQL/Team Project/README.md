(From our report)

### Team Power Final Project

## Introduction:

Our team is driven to create a database through designing concepts, methods, and
tools on related parks and hiking destinations in various states for users to navigate and filter
through. Following the coronavirus pandemic, the world has had to adjust to a new normal
that includes social distancing and masking in crowded environments. With this, everyone
has been looking for different outdoor venues to meet up and have fun with their friends and
family. Seeing this, our team believes that a database that breaks down everything from trail
exits and entrances to the amenities in the nearby vicinity is crucial.
The information that we hope to include pertaining to each trail or park are the sites
located in different states, their addresses, information about the visitor, parking details,
different trails located at the site, the entrances and exits, and finally all the amenities that the
trail offers. As of right now, our database would only consist of certain states, however, our
goal is to eventually have a database that incorporates all sites and parks domestically in the
United States. The scope of this database project is to create a database that allows users to
seamlessly access a variety of information about all the sites and trails in the area they are
searching.

## Database Description

As described in our entity relationship diagram below, our primary key of state_id has
a one-to-many relationship with the locations, as there can be numerous parks and hiking
trails within a state. From there, we have a visitors table that includes different details about
the visitors such as their name and credentials, and a parking records table that indicates
when and where, and in which vehicle each visitor parked in. Additionally, we have a table
dedicated to entrances and exits of each site, a table that highlights trail information, and a
table that includes all the amenities values. The majority of all these relationships are
one-to-many because each location can house different trails and have as many visitors as
possible, therefore, there could be many values.

## Entity Relationship Diagram

<img width="562" alt="Screen Shot 2023-03-10 at 6 40 54 PM" src="https://user-images.githubusercontent.com/58960615/224448594-ffe4d573-fbfb-4c4a-a61c-fd9066296a4f.png">



