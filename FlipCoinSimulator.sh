# Set the number of times to flip the coin
num_flips=10

# Initialize counters for heads and tails
heads=0
tails=0

# Flip the coin and increment the corresponding counter
for (( i=1; i<=$num_flips; i++ ))
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
echo "Results after $num_flips flips:"
echo "Heads: $heads"
echo "Tails: $tails"
