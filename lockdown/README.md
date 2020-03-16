# lockdown
'lockdown' is a program designed with the aim of protecting a laptop. The program will capture the picture from the webcam whenever login fails. It also has functions to counter multiple failed login attempts. 
<br>
## What it does?
Whenever a login attempt fails (sudo/ssh/physical), the webcam will grab the picture and store it at a certain location. If the login process is failed for three times, an alarm is sounded and the system is scheduled to a shutdown in 3 minutes. Both the alarm sound and shutdown time is configurable. The alarm and shutdown can be stopped with a hotkey that owner sets.
<br>
## How it works?
lockdown uses ```streamer```,```ffplay``` and ```shutdown``` tools.<br><br>
```streamer -t 6 -r 1 -s 640x480 -o cap00.jpeg > /dev/null``` will capture webcam shots for 6 seconds as webcam takes 2-3 seconds to kick in. We delete all images except the last one.<br><br>
```ffplay -nodisp -autoexit -loop 10 alert.mp3 >/dev/null 2>&1 &``` will play the ```alert.mp3``` file without any output for 10 times.<br><br>
```shutdown -h +3 2&>1 > /dev/null``` will set the system to shutdown in 3 minutes and the output is sent to ```/dev/null```.<br><br>
A file named ```count``` is used to store the counter for number of failed login attempts.<br>

## How to deploy?
1.[Install ffmpeg](https://www.tecmint.com/install-ffmpeg-in-linux/)<br>
2.[Install streamer](https://www.devmanuals.net/install/ubuntu/ubuntu-12-04-lts-precise-pangolin/install-streamer.html)<br>
3.Download the 'lockdown' directory.<br>
4.Make the ```lockdown``` and ```killalarm.sh``` scripts executable by ```chmod +x lockdown killalarm.sh```<br>
5.Set the keyboard shortcut to execute ```sh -c <path-to-killalarm.sh>```<br> from settings.
6.Test the script by simply calling it.<br>
7.Configure PAM to call this on every failed attempt.<br>
&nbsp;&nbsp;Note: do this carefully - if this fails you'll not be able to gain access to your system again in a regular way.<br>
&nbsp;&nbsp;Open a terminal window with root access (sudo -i) and leave it open - just in case you screw up in the next steps.<br>
&nbsp;&nbsp;Open ```/etc/pam.d/common-auth``` in your favourite editor with ```sudo```.<br>
&nbsp;&nbsp;Keep in mind for the following steps that order of lines in this file matters.<br>
&nbsp;&nbsp;Locate the line below. By default there's one line before the one with ```pam_deny.so```. It looks like this: <br>
```
  auth    [success=1 default=ignore]      pam_unix.so nullok_secure
```
&nbsp;&nbsp;In this line change the success=1 to success=2 to have it skip our script on succes. This is an important step.<br>
&nbsp;&nbsp;Right below there, add a new one to call the actual script:<br>
```
    auth    [default=ignore]                pam_exec.so seteuid /usr/local/bin/grabpicture
```
&nbsp;&nbsp;Save and close the file. No need to restart anything.<br>
8.Test it.<br>
&nbsp;&nbsp;In a new terminal window, as regular user, try ```su -l username``` to log in as another user with username ```username``` (change with an actual one of course).<br>
&nbsp;&nbsp;Deliberately enter the wrong password. Check if this result in a new picture.
&nbsp;&nbsp;The same as above, but now enter the correct password. Check if you log in and it doesn't result in a picture being taken.<br>
&nbsp;&nbsp;If the tests have succeeded you can log out from your DE (Unity/KDE/...) and you should see the same when entering a wrong password from the login screen.
