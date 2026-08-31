while
  battery_status="∞% [PS]"
  date_status=$(date "+ %a, %d %b %Y")
  time_status=$(date "+ %H:%M:%S %p")

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

  echo "Sir, even this too shall pass." \
       ' | ' \
       "Date: $date_status" \
       ' | ' \
       "Time: $time_status" \
       ' | ' \
       "Power: $battery_status" \
       ' | ' \
       "Arch Linux  󰩸"

do
  sleep 1
done

