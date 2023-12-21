@echo off
cd /D "%~dp0"
del *.png
::magick convert -list font 
::identify -list type
magick -background transparent -font "Javanese-Text" -pointsize 72 -gravity center -fill #ff0000FF TEXT:hatemail_16.txt out_magick.png



