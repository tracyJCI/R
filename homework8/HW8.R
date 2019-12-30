# HW8_IS457_8
#Do not remove any of the comments. These are marked by #.
# HW 8 - Due Monday, April. 23rd 2018 in moodle.

# Please upload only R file to Moodle with filename: HW8_IS457_YourCourseID.


### Class ID:

### For this assignment, you will extract useful information from HTML and 
### use Google Earth for data visualization. 
### The hw8.rda file containing the country geographic coordinate is uploaded to Moodle.
### Look at detail instructions for the assignment in hw8_Intro.pdf.


### Part I. Create the data frame from HTML file
### Q1. Load the data frame called LatLon from hw8.rda, 
### install and access XML and RCurl libraries. (2 pts)

### Your code here
load("C:/Users/hw8.rda")
install.packages("XML")
install.packages("RCurl")
library(XML)
library(RCurl)


### Q2. Download html file from the url below with getURL() function 
### and parse it as text.(2 pts)
### (Open the website and have an overview of the HTML file from developer page source.
### We will be working on the data from the table -- 
### UNHCR registered refugees by country/territory of asylum between mid-2015 and 2007)

url = 'https://en.m.wikipedia.org/wiki/List_of_countries_by_refugee_population'

### Your code here
html=getURL(url)
html2=htmlParse(html)

### Q3. There should be 2 tables in the HTML file. Read the first table with 
#### readHTMLTable() function, and set it as a data frame named 'refugee'. (2 pts)

### Your code here
old_refugee=readHTMLTable(html2)
refugee=data.frame(old_refugee[[1]])
refugee= refugee[,-(12)]

### Q4. Select the first three columns from the data frame and name them 
### 'Country.Name', 'refugees_per_1000' and 'refugee_2015'. (2 pts)

### Your code here
names(refugee)[1:3]=c("Country.Name","refugees_per_1000","refugee_2015")

### Q5. Now Capitalize Country.Name in the refugee data set, and merge the refugee 
### with LatLon (from hw8.rda) by Country.Name to create a data frame called 
### AllData that has 6 columns for Latitude, Longitude, CIA.Codes, Country Name, 
### Refugee population, and Refugees per 1,000 inhabitants in mid-2015.
### (please check lat,long are not reversed in the file) (2 pts)

### Your code here

refugee$Country.Name=toupper(refugee$Country.Name)
refugee2=refugee[,1:3]

AllData=merge(LatLon,refugee2)



### Q6. Replace the missing values with the median. 
### (This is a crude but efficient way of treating missing values.) (6 pts)
### (hints: You need to remove commas in large number. 
### Factor type values cannot be converted to numberic values directly.) 

### Your code here
AllData$refugee_2015=gsub(",","",AllData$refugee_2015)
install.packages("varhandle")
library(varhandle)
AllData=unfactor(AllData)

AllData$refugee_2015=as.numeric(AllData$refugee_2015)
median(AllData$refugees_per_1000,na.rm = TRUE)
median(AllData$refugee_2015,na.rm=TRUE)


AllData$refugees_per_1000[is.na(AllData$refugees_per_1000)]  = 0.665
AllData$refugee_2015[is.na(AllData$refugee_2015)]=3240


### Part II.  Create a KML document for google earth visualization.
### Q1. Make the KML document with stucture described in hw8_Intro.pdf.  
### You can use the addPlacemark function below to make the Placemark 
### nodes, for which you need to complete the line for the Point node and
### figure out how to use the function. (10 pts)


makeBaseDocument = function(){
  ### This code creates the template for KML document 
  ### Your code here
 doc = newXMLDoc()
 rootNode = newXMLNode("kml",doc=doc)
 document=newXMLNode("Document", parent=rootNode,doc=doc)
 newXMLNode("Name","Country Facts", parent = document,doc=doc)
 newXMLNode("Description", "Refugee rate", parent=document,doc = doc)
 prt = newXMLNode("Folder", parent=document,doc=doc)
 newXMLNode("Name","CIA Fact Book",parent= prt)
 prt2=newXMLNode("LookAt",parent=document,doc=doc)
 newXMLNode("longitude",parent=prt2)
 newXMLNode("latitude",parent=prt2)
 newXMLNode("altitude",parent=prt2)
 newXMLNode("title",parent=prt2)
 newXMLNode("heading",parent=prt2)
 newXMLNode("altitudeMode",parent=prt2)
 doc    
}

addPlacemark = function(lat, lon, ctryCode, ctryName, ref, ref1000, parent, 
                        ref1000Cut, refCut, style = FALSE)
{
  
  for (num in 1:length(ctryName))
  {
  pm = newXMLNode("Placemark", 
                  newXMLNode("name", ctryName[num]), attrs = c(id = ctryCode[num]), 
                  parent = parent) 

  newXMLNode("description", paste(ctryName[num], "\n Refugee Population: ", ref[num], 
                                  "\n Refugees per 1,000 inhabitants: ", ref1000[num], sep =""),
             parent = pm)

  
  point=newXMLNode("Point", parent=pm)
    newXMLNode("coordinates",paste(lon[num],lat[num],0), parent=point) 
  


             
             
             
### You need to fill in the code for making the Point node above, 
### including coordinates. The line below won't work until you've run 
### the code for the next section to set up the styles.
             
if(style){ newXMLNode("styleUrl", paste("#YOR", ref1000Cut[num], "-", refCut[num], sep = ''), 
                     parent = pm)}
  }
}


### Q2. Use the two functions that you just implemented to created the KML document and save it 
### as 'Part2.kml'. open it in Google Earth. (You will need to install Google Earth.)  
### It should have pushpins for all the countries.  (5 pts)

### Your code here

part2=makeBaseDocument()
addPlacemark(lat = AllData$Latitude,lon = AllData$Longitude,ctryCode = AllData$CIA.Codes,
             ctryName = AllData$Country.Name,ref=AllData$refugee_2015,ref1000 = AllData$refugees_per_1000,
             parent = getNodeSet(part2,"/kml/Document") ,ref1000Cut =AllData$refugees_per_1000 ,refCut = AllData$refugee_2015)
saveXML(part2,file="Part2.kml")


### Part III.  Add Style to your KML
### Now you are going to make the visualizatiion a bit fancier. To be more specific, instead of pushpins, we
### want different circle labels for countris with size refugee population and the color representing  
### the refugees rate.
### Pretty much all the code is given to you below to create style elements.
### Here, you just need to figure out what it all does.

### Start fresh with a new KML document, by calling makeBaseDocument()

doc2 = makeBaseDocument()

### Q1. The following code is an example of how to create cut points for 
### different categories of refugee population and refugee rate.
### Figure out what cut points you want to use and modify the code to create these 
### categories. (2 pts)

ref1000Cut = cut(AllData$refugees_per_1000, breaks = c(0, 10, 25, 50, 75, 200))
ref1000Cut = as.numeric(ref1000Cut)
refCut = cut(AllData$refugee_2015, breaks = 5)
refCut = as.numeric(refCut)

### Now figure out how to add styles and placemarks to doc2
### You'll want to use the addPlacemark function with style = TRUE
### Below is code to make style nodes. 
### You should not need to do much to it.

### Q2. You do want to figure out what scales to use for the sizes of your circles. Try different 
### setting of scale here.

scale = c(1,2.5,4,5.5,7) #Try your scale here for better visualization
colors = c("blue","green","orange","red","yellow")

addStyle = function(col1, pop1, parent, DirBase, scales = scale)
{
  st = newXMLNode("Style", attrs = c("id" = paste("YOR", col1, "-", pop1, sep="")), parent = parent)
  newXMLNode("IconStyle", 
             newXMLNode("scale", scales[pop1]), 
             newXMLNode("Icon", paste(DirBase, "color_label_circle_", colors[col1], ".png", sep ="")), parent = st)
}


root2 = xmlRoot(doc2)
DocNode = root2[["Document"]]


for (k in 1:5)
{
  for (j in 1:5)
  {
    addStyle(j, k, DocNode, 'C:/Users/color_label_circle/')
  }
}

### Q3. You will need to figure out what order to call addStyle() and addPlacemark()
### so that the tree is built properly. You may need to 
### adjust the code to call the png files. (3 pts)

### Your code here
addPlacemark(lat = AllData$Latitude,lon = AllData$Longitude,ctryCode = AllData$CIA.Codes,
             ctryName = AllData$Country.Name,ref=AllData$refugee_2015,ref1000 = AllData$refugees_per_1000,
             parent = DocNode ,ref1000Cut =ref1000Cut ,refCut = refCut,style=TRUE)


### Q4. Finally, save your KML document, call it Part3.kml and open it in Google Earth to 
### verify that it works. (1 pts)

### Your code here
saveXML(DocNode,"Part3.kml")

### For this assignment, you only need to submit your code, nothing else.
### You can assume that the grader has already loaded hw8.rda. 

