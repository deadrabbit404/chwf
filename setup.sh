#!/system/bin/sh
# setup.sh - setup and install chwf script
# By: DeadRabbit
# Telegram: https://t.me/deadrabbit404
# Github: https://github.com/deadrabbit404

TUIDIR="/sdcard/t-ui"
SCRIPTDIR="$TUIDIR/script"
SCRIPT="chwf"
ALIASTXT="$TUIDIR/alias.txt"
BEHAVIORXML=$TUIDIR/behavior.xml

echo ":: Installing $SCRIPT, please wait..."
sleep 1
mkdir -p $SCRIPTDIR && cp -rv $SCRIPT $SCRIPTDIR

# Get the value of alias_param_marker
ALIAS_PARAM_MARKER=`grep 'alias_param_marker' $BEHAVIORXML | sed "s/^.*\"\(.*\)\"\/>.*\$/\1/"`

# Test if the alias for chwf already exist
grep "$SCRIPT" $ALIASTXT >/dev/null 2>&1
if [ $? -ne 0 ]
then
    # Test if the file has no EOL, then print a blank line.
    [ -n "`tail -c 1 $ALIASTXT`" ] && echo >> $ALIASTXT 
    echo "$SCRIPT=sh $SCRIPTDIR/$SCRIPT $ALIAS_PARAM_MARKER" >> $ALIASTXT
else
    # This means the alias name already exists.
    # Replace whatever value assigned to the alias
    # with a new one that points to the sysinfo script.
    sed -i "s#\(^$SCRIPT=\).*\$#\1sh $SCRIPTDIR/$SCRIPT $ALIAS_PARAM_MARKER#" $ALIASTXT
fi

sleep 1
echo ":: Installation finished. Please restart or refresh t-ui."
