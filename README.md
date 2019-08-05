# ChinkalDemo

## General info
Well This is the basic JSON parsing demo with MVVM structure and some filter operations 
	
## Technologies
Project is created with:
* Swift: 5
* Xcode: 10.2
	
## Detail explanation

-  So For this first of all created some ui with searchView and AirportList VC 
-  Then Started with api parse operation using api delegates ( Use URLSession as of now ) 
-  Handle Data using MVVM ( Model + View Model ) 
-  In this case model is Airport and VIewmodel is AIrportViewmodel 
-  Then Parse it to searchVC using Search Delegates and prepare distance object for listVC
-  In LIstVC filtered Array based on Near Airports using distance object 
