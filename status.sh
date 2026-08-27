while
  battery_status="X% [NA]"

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

  echo 'Sir, This too shall pass.' \
       ' | ' \
       "We're at" $battery_status
do
  sleep 10
done

