Author : Alasdair Newson
Date : 18 January 2016


This is an explanatory file for the mouse autism analysis tracking files.

Requirements.

You will need Matlab to execute this code. You should also have the following files :

- get_background_image.m
- get_foreground_region.m
- track_video.m


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			CODE USAGE		     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Follow these steps :

- Open Matlab
- Navigate to the folder where you have put the code
- Open the file named 'track_video.m'
- Go to line 7, you should see the text 'fileName = 'Mice_1';'. Change the file name of your video file. Note, this does not include the extension (the extension is .mp4 by default).

- Now, in the Matlab command window, type :
>> track_video

- The code will ask you to create a polygon by left clicking on the first frame of the video to determine where in the video the algorithm should track the object(s). When you are finished, click right. Outside this area, the algorithm will ignore the information.

- The output will be written to the 'output' subfolder.


