#!/bin/bash

DATE_TO_ADD_EVENT=$(date -v "+8H" -v "+30M" +"%D %T")
CURRENT_DAY=$(date +"%D")
NEXT_DAY=$(date -v "+8H" -v "+30M" +"%D")
TIME=$(date -v "+8H" -v "+30M" +"%T")
if ! (gcalcli agenda | grep -q 'Naar huis'); then
  if [[ $(date +%u) -lt 6 ]]; then
    if [ "$CURRENT_DAY" == "$NEXT_DAY" ]; then
      if [[ "$TIME" > "14:00:00" && "$TIME" < "20:00:00" ]]; then
        /usr/bin/env gcalcli add --title "Naar huis" --when "$DATE_TO_ADD_EVENT" --duration 0 --calendar "Main Calendar" --noprompt
      fi
    fi
  fi
fi
