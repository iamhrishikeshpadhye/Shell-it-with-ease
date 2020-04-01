# Motion_Live
This is a step by step guide to setup <b>Live</b> streaming of your Laptop's webcam.<br>

## From your Linux laptop:
<b>Step 1 :</b> [Install Motion](https://motion-project.github.io/motion_build.html)<br>
To install via apt, open up a terminal window and type:<br> 
```
sudo apt-get install motion
```
<b>Step 2 :</b> Create ```.motion``` directory <br>
Create a directory named ```.motion``` (the dot is significant) at ```home``` location.<br>
```
mkdir ~/.motion
```
<b>Step 3 :</b> Create ```motion.conf``` file and add the configurations<br>
Create a file named ```motion.conf``` in the ```~/.motion/``` directory which acts as a configuration file for the motion application.<br>
```
nano motion.conf
```
Add the following lines to your ```motion.conf``` file:<br>
```
stream_quality 98
stream_maxrate 5
stream_port 9009
stream_localhost off
stream_auth_method 2 
stream_authentication root:hsp12345
output_pictures off
framerate 30
ffmpeg_video_codec mpeg4
http://192.168.43.143:9009/seemenow.cgi
width 320
height 240
auto_brightness off
contrast 0
saturation 0
```
Please take a note that you may change the configurations as per your requirements.<br>
Use the command ```man motion``` to know more about the configurations.<br>
Save the file and exit the editor.<br>
<b>Step 4 :</b> View it in your browser<br>
Type the line<br>
```
xdg-open http://192.168.43.143:9009/seemenow.cgi
```
in the terminal or simply open your browser and type ```http://192.168.43.143:9009/seemenow.cgi``` in the URL bar.<br>
Note that the IP address used here is for example and it may be different for you so configure accordingly.<br>
As we have setup an authentication for secure access to our streaming, you shall be prompted a basic HTTP authentication when you will try to access the service. The credentials for the same are configured in our ```motion.conf``` file on the line ```stream_authentication```<br>
Enter the credentials and there you go!!!<br>
<br>

## From your Smartphone:
In this technique, we will be using a 'SSH Client' to remote login to our Linux system and then configure the steps accordingly.<br>
<b>Step 1 :</b> [Install Termux](https://play.google.com/store/apps/details?id=com.termux&hl=en_IN) for Android or [Install Termius](https://apps.apple.com/gr/app/termius-ssh-client/id549039908) for iPhone<br>
There are a lot of SSH-CLient applications and Linux emulators for Android phones but I would recommend Termux as it has a lot of features and a great community support.You may use any other application of your choice.<br>
<b>Step 2 :</b> Install ```OpenSSH```<br>
```
pkg install openssh
```
<b>Step 3 :</b> Login to your system<br>
```
ssh <user>@<IP>
```
![SSH login](https://github.com/iamhrishikeshpadhye/Shell-it-with-ease/blob/master/Motion_Live/Screenshots/Screenshot%20from%20clideo.com.png)
<b>Step 4 :</b> Install and configure motion as explained in the previous part of this guide.<br>
![Edit motion.conf](https://github.com/iamhrishikeshpadhye/Shell-it-with-ease/blob/master/Motion_Live/Screenshots/Screenshot%20from%20clideo.com%20-%201.png)
<b>Step 5 :</b> View it in your browser<br>
Open your browser and type ```http://192.168.43.143:9009/seemenow.cgi``` in the URL bar.<br>
Complete the authentication process and there you go!!!<br>
![Authentication](https://github.com/iamhrishikeshpadhye/Shell-it-with-ease/blob/master/Motion_Live/Screenshots/Screenshot%20from%20clideo.com%20-%202.png)
![Stream](https://github.com/iamhrishikeshpadhye/Shell-it-with-ease/blob/master/Motion_Live/Screenshots/Screenshot%20from%20clideo.com%20-%203.png)
