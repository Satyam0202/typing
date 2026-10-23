#!/bin/bash

start_date="2025-09-07"
end_date="2025-10-23"

current=$(date -d "$start_date" +%Y-%m-%d)
end_time=$(date -d "$end_date" +%s)

echo "Script shuru: $start_date se $end_date tak (Daily 5 commits)..."

while [ $(date -d "$current" +%s) -le $end_time ]; do
    echo "Processing: $current"
    
    for i in 1 2 3 4 5; do
        echo "Activity on $current - $i - $(date +%s%N)" >> activity.txt
        git add activity.txt
        HOUR=$((10 + i))
        MIN=$((RANDOM % 60))
        
        GIT_AUTHOR_DATE="$current $HOUR:$MIN:00" GIT_COMMITTER_DATE="$current $HOUR:$MIN:00" git commit -m "chore: daily activity $current #$i" --quiet
    done
    
    current=$(date -d "$current + 1 day" +%Y-%m-%d)
done

echo "Ho gaya! Ab push karo."
