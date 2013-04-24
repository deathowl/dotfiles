#A script for fetching now playing from last.fm
#Replace username with your username
#put this into .irssi/scripts/np.sh

echo "I'm listening to "|tr -d '\n'
wget -qO - http://ws.audioscrobbler.com/1.0/user/deathowlz/recenttracks.txt |
cut -d "," -f 2 | head -1 |tr -d '\n'
echo " on last.fm"

#Add This to aliases in your irssi config
#np = "/exec -o - /home/$USER/.irssi/scripts/np.sh";
