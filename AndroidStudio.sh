~/Downloads/Google/android-studio/bin/studio.sh nosplash &
mytitle='Starting Studio'
targettitle='Android Studio'
targetlabel='Starting Android Studio'

dimensions=`xdpyinfo | fgrep dimensions`
echo $dimensions
pattern='[a-z: ]+([0-9]+)(.+)'
[[ $dimensions =~ $pattern ]]
screenwidth=${BASH_REMATCH[1]}
[[ ${BASH_REMATCH[2]} =~ $pattern ]]
screenheight=${BASH_REMATCH[1]}
pattern='([a-z0-9]+)(.+)'
if wmctrl -l | fgrep -q xclock ; then
    geometry=`wmctrl -l -G | fgrep xclock`
    [[ $geometry =~ $pattern ]]
    [[ ${BASH_REMATCH[2]} =~ $pattern ]]
    [[ ${BASH_REMATCH[2]} =~ $pattern ]]
    [[ ${BASH_REMATCH[2]} =~ $pattern ]]
    [[ ${BASH_REMATCH[2]} =~ $pattern ]]
    [[ ${BASH_REMATCH[2]} =~ $pattern ]]
    clockheight=${BASH_REMATCH[1]}
    screenheight=$(($screenheight-$clockheight-45))
fi
echo screenwidth=$screenwidth screenheight=$screenheight
{
    until { wmctrl -l | fgrep -q "$mytitle" ; }
    do
        continue
    done
    wmctrl -r "$mytitle" -T "$mytitle"
    geometry=`wmctrl -l -G | fgrep "$mytitle"`
    pattern='([a-z0-9]+)(.+)'
    [[ $geometry =~ $pattern ]]
    [[ ${BASH_REMATCH[2]} =~ $pattern ]]
    [[ ${BASH_REMATCH[2]} =~ $pattern ]]
    [[ ${BASH_REMATCH[2]} =~ $pattern ]]
    [[ ${BASH_REMATCH[2]} =~ $pattern ]]
    width=${BASH_REMATCH[1]}
    [[ ${BASH_REMATCH[2]} =~ $pattern ]]
    height=${BASH_REMATCH[1]}
    echo width=$width height=$height
    xpos=$(($screenwidth-$width))
    ypos=$((screenheight-$height))
    wmctrl -r $mytitle -e 0,$xpos,$ypos,-1,-1
} &
kdialog --title "$mytitle" --msgbox "$targetlabel" &
until { wmctrl -l | fgrep -q "$mytitle" ; }
do
    sleep 1
done
until { wmctrl -l | fgrep -q "$targettitle" ; }
do
    if { wmctrl -l | fgrep -q "$mytitle" ; } then
        sleep 1
    else
        exit
    fi
done
wmctrl -c $mytitle
