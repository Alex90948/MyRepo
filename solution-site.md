Assignment: DEBUG THE WEBSITE AND PERMUTIVE SDK

DEBUG THE WEBSITE: INITIAL STEPS
I cloned the git repository locally. I then installed node.js and run the repo on the localhost (8080) and I performed an initial check of how the website is built (pages, links) to check for any bugs.
I also used GitHub pages, which gives you the possibility of publishing your website and through the http:// link created 
 and tested the website on different on my phone too.
I then researched how to test accessibility and responsiveness and chose to use the following websites: 
•	https://www.w3.org/WAI/test-evaluate/preliminary/: /: to research content about correct website accessibility
•	https://www.w3.org/WAI/ER/tools/: to check for tools analysing website accessibility
•	https://wave.webaim.org/ which tests pages for accessibility providing a list of alerts and errors
•	https://www.a11yproject.com/checklist/: for tips and list of elements to check to make sure pages are accessible

BUGS AND WEBSITES USED
The bugs regarding HTML found in the html documents regard: 
•	Missing meta data (e.g. the language and viewport tag)
•	Missing tags to structure the text properly (paragraphs, headings, super tags)
•	Incorrect paths to retrieve file and to create links

Various issues regarding CSS applied to the documents make the articles difficult to read:
•	Div width 50% is not suitable for desktop pages 
•	Colours used for the background and foreground are too light. A correct colour contrast, which ideally respects the ratio of at least 4:5:1 should be used.
•	No space between text and div border, so I added padding.
•	No CSS on the Fibonacci page.

The respective solutions for the above bugs have been added onto the html/CSS files provided.

I used different websites to complete this task: 
•	https://stackoverflow.com/
•	https://www.w3schools.com/html/
•	https://developer.mozilla.org/en-US/
•	https://contrastchecker.com/
•	https://coolors.co/

After making the necessary changes, I made a final check for accessibility and responsiveness by using Wave and by visiting the website on multiple device sizes to ensure it can be used if significantly zoomed in.

DEBUG THE PERMUTIVE SDK

I checked the resourses given in the assignment and based on the information found, I think there are some errors in how the Permutive JS script was added onto the file:

•	The Permutive SDK is located in the body, instead of in the head of the document
•	The SDK wouldn’t get downloaded correctly as async is missing from the JS tag
•	<API_KEY>  in the JS tag is not defined with the respective value
•	No  “_pdfps” 