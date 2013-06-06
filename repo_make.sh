#Plesae move this script to your 'deb' folder
#Please move the file Release.head to your 'deb' folder
################################################


#Remove old files
#################
rm Packages
rm Packages.gz
rm Release
rm Release.gpg

#Create Packages.gz and Release file
####################################
apt-ftparchive packages . > Packages
cp Packages Packages.tmp
gzip -9 Packages
mv Packages.tmp Packages
apt-ftparchive release . > Release.footer
cat Release.head > Release
cat Release.footer >> Release

rm Release.footer

#Sign Release file
##################
gpg --output Release.gpg -ba Release

