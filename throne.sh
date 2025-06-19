#!/bin/bash


RED='\033[1;31m'
BLACK='\033[1;30m'
WHITE='\033[1;37m'
GREEN='\033[1;32m'
NC='\033[0m'


display_interface() {
    clear
    printf "${RED}════════════════════════════════════════════════════════════${NC}\n"
    printf "${BLACK}   L I S H T H A G E${NC}\n"
    printf "${GREEN}   THRONE - DARK EMPIRE OF CYBER DOMINION${NC}\n"
    printf "${WHITE}   Forged by Layos | https://t.me/sirerror404${NC}\n"
    printf "${RED}   Enter the abyss... your reign begins.${NC}\n"
    printf "${RED}════════════════════════════════════════════════════════════${NC}\n"
    printf "${WHITE}   Status: Running...${NC}\n"
    printf "${WHITE}   ---------------------------${NC}\n"
}


display_status() {
    local message="$1"
    printf "${WHITE}   > ${GREEN}%s${NC}\n" "$message"
    if [ $((RANDOM%2)) -eq 0 ]; then
        printf "${RED}   [WARNING: SHADOWS MOVING...]${NC}\n"
    fi
    ((LINE_COUNT++))
    if [ $LINE_COUNT -ge 5 ]; then
        display_interface
        LINE_COUNT=0
    fi
}


try_command() {
    local cmd="$1"
    local desc="$2"
    display_status "$desc"
    if ! (command -v sudo >/dev/null 2>&1 && sudo $cmd) && ! $cmd 2>/dev/null; then
        errors+=("Skipped: $desc (Failed: $cmd)")
    fi
}


check_internet() {
    if ! ping -c 1 google.com 2>/dev/null; then
        printf "${RED}   [ERROR: NO INTERNET CONNECTION]${NC}\n"
        exit 1
    fi
    apt update -y 2>/dev/null || true
}


errors=()
LINE_COUNT=0


check_internet
display_interface


try_command "echo 'kali' > /etc/hostname && sed -i 's/debian/kali/g' /etc/hosts && hostnamectl set-hostname kali" "Setting Kali hostname"
try_command "echo 'deb http://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list && wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add - && echo 'Package: *' > /etc/apt/preferences.d/kali.pref && echo 'Pin: release a=kali-rolling' >> /etc/apt/preferences.d/kali.pref && echo 'Pin-Priority: 50' >> /etc/apt/preferences.d/kali.pref && apt update -y" "Configuring Kali repository"
try_command "echo 'deb http://ftp.debian.org/debian unstable main contrib non-free' > /etc/apt/sources.list.d/debian-unstable.list && echo 'deb http://deb.debian.org/debian experimental main' > /etc/apt/sources.list.d/debian-experimental.list && echo 'Package: *' > /etc/apt/preferences.d/debian-unstable.pref && echo 'Pin: release a=unstable' >> /etc/apt/preferences.d/debian-unstable.pref && echo 'Pin-Priority: 50' >> /etc/apt/preferences.d/debian-unstable.pref && echo 'Package: *' > /etc/apt/preferences.d/debian-experimental.pref && echo 'Pin: release a=experimental' >> /etc/apt/preferences.d/debian-experimental.pref && echo 'Pin-Priority: 50' >> /etc/apt/preferences.d/debian-experimental.pref && apt update -y" "Expanding Debian sources"
try_command "apt update -y && apt upgrade -y" "Updating system"
try_command "apt install -y bash-completion wget nano gnupg fonts-dejavu fonts-hack python3 python3-pip git curl tor openssh-client net-tools" "Installing core tools"
try_command "apt install -t kali-rolling nmap metasploit-framework sqlmap aircrack-ng hydra airgeddon burpsuite wireshark john hashcat ettercap maltego -y" "Deploying hacking suite"
try_command "echo '[ -f /etc/bash_completion ] && . /etc/bash_completion' >> ~/.bashrc && echo 'export LS_COLORS=\"rs=0:di=1;34:ln=1;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=1;32:*.tar=1;31:*.tgz=1;31:*.arc=1;31:*.arj=1;31:*.taz=1;31:*.lha=1;31:*.lz4=1;31:*.lzh=1;31:*.lzma=1;31:*.tlz=1;31:*.txz=1;31:*.tzo=1;31:*.t7z=1;31:*.zip=1;31:*.z=1;31:*.dz=1;31:*.gz=1;31:*.lrz=1;31:*.lz=1;31:*.lzo=1;31:*.xz=1;31:*.zst=1;31:*.tzst=1;31:*.bz2=1;31:*.bz=1;31:*.tbz=1;31:*.tbz2=1;31:*.tz=1;31:*.deb=1;31:*.rpm=1;31:*.jar=1;31:*.war=1;31:*.ear=1;31:*.sar=1;31:*.rar=1;31:*.alz=1;31:*.ace=1;31:*.zoo=1;31:*.cpio=1;31:*.7z=1;31:*.rz=1;31:*.cab=1;31:*.wim=1;31:*.swm=1;31:*.dwm=1;31:*.esd=1;31:*.jpg=1;35:*.jpeg=1;35:*.mjpg=1;35:*.mjpeg=1;35:*.gif=1;35:*.bmp=1;35:*.pbm=1;35:*.pgm=1;35:*.ppm=1;35:*.tga=1;35:*.xbm=1;35:*.xpm=1;35:*.tif=1;35:*.tiff=1;35:*.png=1;35:*.svg=1;35:*.svgz=1;35:*.mng=1;35:*.pcx=1;35:*.mov=1;35:*.mpg=1;35:*.mpeg=1;35:*.m2v=1;35:*.mkv=1;35:*.webm=1;35:*.webp=1;35:*.ogm=1;35:*.mp4=1;35:*.m4v=1;35:*.mp4v=1;35:*.vob=1;35:*.qt=1;35:*.nuv=1;35:*.wmv=1;35:*.asf=1;35:*.rm=1;35:*.rmvb=1;35:*.flc=1;35:*.avi=1;35:*.fli=1;35:*.flv=1;35:*.gl=1;35:*.dl=1;35:*.xcf=1;35:*.xwd=1;35:*.yuv=1;35:*.cgm=1;35:*.emf=1;35:*.ogv=1;35:*.ogx=1;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:\"' >> ~/.bashrc && echo 'alias ls=\"ls --color=auto\"' >> ~/.bashrc && echo \"PS1='\\[\e[31m\\]┌──(\\[\e[31m\\]\\u㉿kali\\[\e[31m\\])-[\[\e[34m\\]\\w\\[\e[31m\\]]\\n\\[\e[31m\\]└─# \\[\e[m\\]'\" >> ~/.bashrc && source ~/.bashrc" "Customizing terminal"
try_command "pip3 install requests aiohttp scapy paramiko cryptography pyOpenSSL" "Installing Python tools"
try_command "apt autoremove -y && apt autoclean" "Cleaning system"


source ~/.bashrc


display_status "Configuration completed"
printf "${GREEN}   Current PS1: \\[\e[31m\\]┌──(\\[\e[31m\\]\\u㉿kali\\[\e[31m\\])-[\[\e[34m\\]\\w\\[\e[31m\\]]\\n\\[\e[31m\\]└─# \\[\e[m\\]${NC}\n"
for desc in "Setting Kali hostname" "Configuring Kali repository" "Expanding Debian sources" "Updating system" "Installing core tools" "Deploying hacking suite" "Customizing terminal" "Installing Python tools" "Cleaning system"; do
    if ! [[ " ${errors[*]} " =~ " $desc " ]]; then
        printf "${GREEN}   ✓ Success: $desc${NC}\n"
    fi
done


display_status "Optional: Install full Kali Linux package? (y/n)"
read -p "   Enter choice: " choice
if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    try_command "apt install -y kali-linux-full" "Installing Kali Linux full package"
    if ! [[ " ${errors[*]} " =~ "Installing Kali Linux full package" ]]; then
        printf "${GREEN}   ✓ Kali Linux full package installed successfully.${NC}\n"
    fi
else
    printf "${RED}   Skipping Kali Linux full package installation.${NC}\n"
fi


display_status "THRONE setup finalized"
printf "${GREEN}   Your dark empire is now operational.${NC}\n"
printf "${WHITE}   Contact the shadows: https://t.me/sirerror404${NC}\n"


if [ ${#errors[@]} -gt 0 ]; then
    printf "\n${RED}═╣ SHADOWS OF FAILURE ╠═${NC}\n"
    for error in "${errors[@]}"; do
        printf "${WHITE}- $error${NC}\n"
    done
fi


printf "${RED}   [THE ABYSS AWAKENS...]${NC}\n"
