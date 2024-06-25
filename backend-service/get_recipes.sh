#!/bin/bash

# ID específico que deseas utilizar para las solicitudes GET
SPECIFIC_ID="667a443d6c156834d9b46da9"

total_start=$(date +%s%3N)

for i in {1..1000}
do
  start=$(date +%s%3N)
  response=$(curl -s -o /dev/null -w "%{http_code}" -X GET http://localhost:5000/api/recipes/$SPECIFIC_ID)
  end=$(date +%s%3N)
  duration=$((end - start))

  if [ $response -eq 200 ]; then
    echo "Found match in GET request $i (Time: $duration ms)"
  fi
done

total_end=$(date +%s%3N)
total_duration=$((total_end - total_start))
echo "Total time for 1000 GET requests: $total_duration ms"
