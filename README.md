# MusicGen
Music Generator using a probablity of next keys pressed from famous music pieces.

Haskell Music Gen
<br>
<h1>Part A.</h1>
Overview: The aim of the first part of the project was to generate a sorted list according to frequency of the character. The list is in the following format (Pressed Character, [Frequencies of the next pressed character]). This will serve as a main component of our project in order to help generate the final output in Part B.
To implement Part A several helper methods were needed and they are listed below:
<ol>
1.	charIndex: The function takes a nested list and a character and finds all the indices of their adjacent characters occurring after them. We used map with a (+1) on all the indices from findIndicies (==char).
Sample I/O: a call on ‘a’ would lead to [“fhlskj”, “ababab”]  [],[1,3,5] </ol>
<ol>2.	elements: The function takes a list of indices and a String in our case and gets the elements in list form with a check on length so that index won’t be too large.
Sample I/O: a call on [1,3,5] “ababab”  “bbb”</ol>
<ol>3.	add_elements: The function takes a list of list of indices and the list of lists of strings. It then uses a single list of indices to find on elements and its mapped string. Meaning the first list of indices with the first list in training. Adds all the elements in one list.</ol>
<ol>4.	remove_duplicates: The function removes duplicates using the built in function called nub.</ol>
<ol>5.	countOcc: Intuitively by its name the function takes a list of non-duplicated characters and a list of duplicates and counts the number each characters occurs and adds them finally to a list.</ol>
<ol>6.	add: It works by creating the tuple of (freq, ‘char’) it takes the list from countOcc and the non-duplicate list and creates a list of tuples.</ol>
<ol>7.	run: It takes a char and a list ”training”. This is one of the main functions that incorporates all the helpers above into one line and generates the output of the final list. It uses add to create the first list of tuples of a given character.</ol>
<ol>8.	stats: It takes a list of chars and passes each one independently inside to the function run. It also uses sort and reverse to arrange them in increasing frequencies. The function generates a tuples of the following format (char, [(),()]).</ol> 
<ol>9.	makeStatsList: calls stats with chars and training to receive the final output.</ol>

<h1>Part B.</h1>
Overview: This part will mainly focusing on using the statistics generated from part A and generate a final string based on a random method discussed below. 
<ol>
1.	Character  z  string:   takes a character and string and generates a string of characters after this character z </ol>
<ol>2.	Help z List: List is a list of String (training) so it generates string of characters after character Z in the whole list of string using (Character z  string). For example help ‘0’ training="wwqqwwwwww"</ol>
<ol>3.	Compose z n : takes a character and n which is the length of the string that be the output , it appends the character then calls the method again with character after it and decrementing n, and makes the probability itself as it uses !! randomtoX on help z List .</ol>

To play the file just open virtual piano. Copy the string generated and run the script.


