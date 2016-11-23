# Phase3
John Monahan, Eric Libby, Pete McCoy, Nicholas Pickett
Sources:
For NFL career data for the players drafted within the years 2004-2007 we used the following websites:  This was the easier part of the data preparation, since all of the required data was in one location.
http://www.pro-football-reference.com/years/2004/draft.htm
http://www.pro-football-reference.com/years/2005/draft.htm
http://www.pro-football-reference.com/years/2006/draft.htm
http://www.pro-football-reference.com/years/2007/draft.htm

In order to get their college statistics, we used this website here for each player.  We went through each player individually, so the URL would be different for each player.
http://www.sports-reference.com/cfb/players/

Finding combine data was the toughest, since some players did not have certain workouts done.  For example, not many quarterbacks participate in the bench press drill.  Similar to the college data, we individually went through and found the combine data for each player.  For these statistics we used:
www.draftscout.com   
We were able to type in players in the sidebar of the website, which made it fairly easy to locate at least some of their statistics from their respective combine.  

To merge and clean this data we used excel and RStudio to combine the csv’s.  On excel, we went through and deleted unnecessary players at certain positions or drafted after round 3.  RStudio  was also very useful in helping us clean the data, since it output some errors when we first tried merging.  For the most part, we did not collaborate while getting our data, so we had some different columns and ways of setting it up.  As one can guess, R was not able to merge the data while it was not the same.  We took a step back, figured out what differed and cleaned the data in order to make sure our formats and columns were exactly the same.  The easiest way to merge the data, was to put the 3 (soon to be 4) csv’s into one working directory in R.  Then we used the command “list.files” which created a list of the three csv’s. At first we were trying this while the data was in a large working directory, and it was trying to read and combine all csv’s and not just these three, which created an error.  We then used the command “lapply” and “rbind” in order to add the three separate csv’s into one large data set.  After numerous tries, we were successful and it came out just as we wanted.
