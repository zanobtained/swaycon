while
  date_status=$(date "+%F @ %H:%M %p")
  battery_status="N/A"

  for bat in /sys/class/power_supply/BAT*; do
    if [ -e "$bat/capacity" ]; then
      cap=$(cat "$bat/capacity")
      stat=$(cat "$bat/status")
            
      if [ "$stat" = "Charging" ]; then
        battery_status="${cap}% [CH]"
      elif [ "$stat" = "Full" ]; then
        battery_status="${cap}% [FU]"
      else
        battery_status="${cap}% [DC]"
      fi

      break
    fi
  done

  echo 'This Too Shall Pass' \
       ' | ' \
       'Battery:' $battery_status \
       ' | ' \
       'Date:' $date_status \
       ' ';
do
  sleep 60
done

