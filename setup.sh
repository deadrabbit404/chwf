#!/system/bin/sh
#
# Description: Setup and install chwf
# By: DeadRabbit
# Telegram: https://t.me/deadrabbit404
# Github: https://github.com/deadrabbit404

TUI="/sdcard/t-ui"
TARGET="chwf"
DST="$TUI/script"
ALIASTXT="$TUI/alias.txt"

echo ":: Installing chwf, please wait..."
sleep 1

mkdir -p $DST && cp "$TARGET" "$DST"
[ $? -ne 0 ] && echo ":: Error: setup failed" >&2 && exit 1

# Append an alias for script
! grep "^chwf" "$ALIASTXT" &>/dev/null \
    && printf "\n%s\n" "chwf=sh $DST/$TARGET %" >> "$ALIASTXT"
    
echo ":: Installation finish, please restart t-ui"
