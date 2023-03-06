target_wins=21

# Initialize counters for heads and tails
heads=0
tails=0

# Flip the coin until one side wins the target number of times
while [ $heads -lt $target_wins ] && [ $tails -lt $target_wins ]
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
  echo "It's a tie!"
fi
