# still used in prod lmao
# but uh exits if path too long??

echo "rendering frame $1"
if [ ${#1} -gt 15 ]; then
  echo "path too long idk"
  exit 1
fi

convert "$1" -resize 512x512 "out.png" # requires imagemagick btw

# also what even was render2d mode?? can't find it
