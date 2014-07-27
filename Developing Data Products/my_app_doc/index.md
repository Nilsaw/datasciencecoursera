---
title       : Data Upload Shiny application
subtitle    : Developing Data Products Course
author      : Nilesh Sawant
job         : Part-time wannabe musician
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

1. This is a simple Shiny application which processes the input document.
2. You can visit the application through this [link](http://nilsaw.shinyapps.io/my_app)
3. It is based on this [tutorial](http://rstudio.github.io/shiny/tutorial/#uploads)
4. This documentation has been created using slidify.

--- .class #id 

## Application workflow.

1. Upload the sample documents from [here](https://github.com/Nilsaw/datasciencecoursera/blob/master/Developing%20Data%20Products/Test%20Files/mtcars.csv) or [here](https://github.com/Nilsaw/datasciencecoursera/blob/master/Developing%20Data%20Products/Test%20Files/pressure.tsv)
2. To save the files, right-click on the Raw button and select the save-link as option.
3. On the sidepanel you will see a header check-box button and three Seperator and Quote radio buttons.
4. On selecting the header option, you will see the document headers in the header field.
5. The 'Seperator' radio buttons will use the selected characters as seperator fields for the documents, to be presented in the tabular format.
6. The 'Quote' radio buttons filter out the selected characters from the cells.


--- .class #id 

## Assignment details explained.

1. The calculations on the R server file is done while reading the data and setting the attributes to the file while reading it. Attributes are functions applied, like sep, and quote.

2. The results of the calculations are displayed on the tables.

3. The small code walkthrough is in the next slide.

--- .class #id 

## Code walkthrough

1. This piece of code in the server.r file that reads the data file. The details have been hardcoded and shortened to better reading.


```r
head(read.csv("mtcars.csv", header = TRUE, sep = ",", quote = "\""))
```

```
##                   X  mpg cyl disp  hp drat    wt  qsec vs am gear carb
## 1         Mazda RX4 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## 2     Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## 3        Datsun 710 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## 4    Hornet 4 Drive 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## 5 Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## 6           Valiant 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```


2. Here, the header option is set to true, the seperator selected is a comma and the quotes option selected is that of double quotes.
