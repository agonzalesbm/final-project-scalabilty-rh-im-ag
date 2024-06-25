#!/bin/bash

# ID específico que deseas utilizar para las eliminaciones
SPECIFIC_ID="667a43f76c156834d9b46be7"

total_start=$(date +%s%3N)

for i in {1..1000}
do
  start=$(date +%s%3N)
  response=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE http://localhost:5068/api/recipes/$SPECIFIC_ID)
  end=$(date +%s%3N)
  duration=$((end - start))

  if [ $response -eq 204 ]; then
    echo "Deleted recipe $SPECIFIC_ID in request $i (Time: $duration ms)"
  fi
done

total_end=$(date +%s%3N)
total_duration=$((total_end - total_start))
echo "Total time for 1000 DELETE requests: $total_duration ms"
