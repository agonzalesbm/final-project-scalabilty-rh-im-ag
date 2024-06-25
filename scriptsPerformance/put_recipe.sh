#!/bin/bash

# ID específico que deseas utilizar para las actualizaciones
SPECIFIC_ID="667a43f56c156834d9b46bde"

total_start=$(date +%s%3N)

for i in {1..1000}
do
  start=$(date +%s%3N)
  response=$(curl -s -o /dev/null -w "%{http_code}" -X PUT http://localhost:5068/api/recipes/$SPECIFIC_ID \
       -H "Content-Type: application/json" \
       -d '{
             "name": "Updated Recipe",
             "preparationTime": 35,
             "cookingTime": 25,
             "portions": 5,
             "difficultyId": 3,
             "ingredientes": [
               "New Ingredient1",
               "New Ingredient2"
             ],
             "steps": [
               "New Step1",
               "New Step2"
             ],
             "creatorId": 102,
             "creatorName": "Updated Creator",
             "dateCreation": "'$(date --utc +%Y-%m-%dT%H:%M:%SZ)'"
           }')
  end=$(date +%s%3N)
  duration=$((end - start))

  if [ $response -eq 200 ]; then
    echo "Updated recipe $SPECIFIC_ID in request $i (Time: $duration ms)"
  fi
done

total_end=$(date +%s%3N)
total_duration=$((total_end - total_start))
echo "Total time for 1000 PUT requests: $total_duration ms"
