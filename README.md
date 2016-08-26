# JHDS03-Proj01
This repo contains the R Code and the png it generates as part of an assessment item for a Data Science unit from JohnHopkins

The script files are :
* plot1.R  
* plot2.R  
* plot3.R  
* plot4.R  

The images that they generate are :  
* plot1.png  
* plot2.png  
* plot3.png  
* plot4.png  


Each script performs these tasks :  
  1. pulls zip from the internet  
  2. unzips the file to the working directory  
  3. cleans and extracts a data subset  
  4. opens a png file as a device  
  5. generates a plot to this device  
  6. closes the device  
  7. clears the environment

###Note:  
Each plot script is independent of the others, so each script will pull the complete 20M zip file from the web.  
You can comment out the download.file and unzip lines at the start of a script if you wish to avoid unnesesary downloads.  
To further simplify the code you could combine all scripts into a single file, and thus avoid reworking the data preparation tasks.  
However the project brief specifically asks for seperate files for each plot, and that each script should include "code for reading the data".  
