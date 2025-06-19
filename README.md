# Termux setup for install kali-linux - By The Greet Layos >> 
tele : https://t.me/sirerror404


Guide to Installing Kali Linux Tools in Termux (Debian via proot-distro)
Hey there! This guide walks you through setting up a Termux environment on your Android device, installing a Debian distribution, and adding Kali Linux repositories to install essential tools and the full Kali Linux package. I’ve put this together based on my own experience tinkering with these setups, and it works great without needing root access. Let’s dive in!

Requirements
An Android device with a stable internet connection.
The Termux app installed (download it from F-Droid or Google Play).
At least 5-10 GB of free storage space.
Step-by-Step Instructions
1. Install Termux
Grab Termux from one of these sources:
F-Droid: https://f-droid.org/packages/com.termux/
Google Play Store: https://play.google.com/store/apps/details?id=com.termux
Once installed, open the app to get started. It’s a lightweight tool, so it won’t take long to set up.
2. Update Termux and Install Essential Tools
Run this command to update Termux and install the necessary packages:
bash



pkg update && pkg upgrade -y && pkg install proot-distro wget curl git -y
What’s Happening: The pkg update && pkg upgrade -y refreshes your package list and upgrades everything. Then, pkg install proot-distro wget curl git -y adds proot-distro (to manage distributions), plus wget, curl, and git for downloading and managing files. I’ve found this combo super useful for these kinds of projects.


3. Install the Debian Distribution
Download and set up Debian with this command:
bash


proot-distro install debian

What’s Happening: This pulls the latest Debian version and sets it up as an isolated environment. It might take a while depending on your internet speed, so grab a coffee if needed!
4. Log into the Debian Environment
Jump into your new Debian setup:
bash

proot-distro login debian
What’s Happening: This opens a Debian terminal. The first time you log in, it might ask you to set up a root password—go ahead and do that. It’s a quick step to secure your environment.


5. Add Kali Linux Repositories
Add the official Kali repository:
bash


echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list.d/kali.list
Add the authentication key:
bash

wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add -
Set priority to avoid conflicts with Debian repos:
bash



echo "Package: *" > /etc/apt/preferences.d/kali.pref
echo "Pin: release a=kali-rolling" >> /etc/apt/preferences.d/kali.pref
echo "Pin-Priority: 50" >> /etc/apt/preferences.d/kali.pref
Update the package list:
bash


apt update
What’s Happening: These steps add Kali’s repo, verify it with a key, set a priority to keep things smooth with Debian, and refresh the package list. I’ve run into conflicts before, so this priority trick really helps.


6. Install Essential Tools
Install a set of basic tools you’ll need:
bash

apt install -y bash-completion wget nano gnupg fonts-dejavu fonts-hack python3 python3-pip git curl tor openssh-client net-tools
What’s Happening: This installs handy stuff like tab completion, a text editor (nano), encryption tools (gnupg), programming support (python3), and network utilities. I use these daily when working in this setup.


7. Install the Full Kali Linux Package
Download and install the full Kali package:
bash


apt install -y kali-linux-full
What’s Happening: This pulls in every Kali tool (think nmap, metasploit, aircrack-ng, and more). It’s a big download, so make sure you’ve got the space. If it’s too heavy, you can swap it for apt install -y kali-linux-default for a lighter version.
8. Customize the Terminal (Optional)
Spruce up your terminal with a custom PS1:
bash

echo "PS1='\[\e[31m\]┌──(\[\e[31m\]\u㉿kali\[\e[31m\])-[\[\e[34m\]\w\[\e[31m\]]\n\[\e[31m\]└─# \[\e[m\]'" >> ~/.bashrc
source ~/.bashrc
What’s Happening: This changes the prompt to look like a Kali-style terminal. I love this aesthetic—it makes the experience feel more immersive.
9. Clean Up the System
Remove unused packages and clean up:
bash

apt autoremove -y && apt autoclean


What’s Happening: This frees up space by clearing out temporary files and dependencies you don’t need anymore. It’s a good habit to keep things tidy.


Support
Got questions or hit a snag? Reach out to me at: https://t.me/sirerror404
