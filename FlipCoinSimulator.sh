target_wins=21
min_win_diff=2

# Initialize counters for heads and tails
heads=0
tails=0

# Flip the coin until one side wins the target number of times by the minimum win difference
while [ $heads -lt $(($target_wins-$min_win_diff+1)) ] && [ $tails -lt $(($target_wins-$min_win_diff+1)) ] || [ $(($heads-$tails)) -lt $min_win_diff ] && [ $(($tails-$heads)) -lt $min_win_diff ]
do
  result=$((RANDOM % 2))
  if [ $result -eq 0 ]
  then
    heads=$((heads+1))
  else
    tails=$((tails+1))
  fi
done

# Display the results
echo "Results after $((heads+tails)) flips:"
if [ $heads -gt $tails ]
then
  echo "Heads wins by $((heads-tails))"
elif [ $tails -gt $heads ]
then
  echo "Tails wins by $((tails-heads))"
else
  # If there is a tie, continue flipping the coin until one side wins by the minimum win difference
  while [ $(($heads-$tails)) -lt $min_win_diff ] && [ $(($tails-$heads)) -lt $min_win_diff ]
  do
    result=$((RANDOM % 2))
    if [ $result -eq 0 ]
    then
      heads=$((heads+1))
    else
      tails=$((tails+1))
    fi
  done

  # Display the results of the tiebreaker
  if [ $heads -gt $tails ]
  then
    echo "Heads wins by $((heads-tails))"
  else
    echo "Tails wins by $((tails-heads))"
  fi
fi
