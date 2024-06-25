#!/bin/bash

total_start=$(date +%s%3N)

for i in {1..1000}
do
  start=$(date +%s%3N)
  response=$(curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:5068/api/recipes \
       -H "Content-Type: application/json" \
       -d '{
             "name": "Recipe '"$i"'",
             "preparationTime": 30,
             "cookingTime": 20,
             "portions": 4,
             "difficultyId": 2,
             "ingredientes": [
               "Ingredient1",
               "Ingredient2",
               "Ingredient3"
             ],
             "steps": [
               "Step1",
               "Step2",
               "Step3"
             ],
             "creatorId": 101,
             "creatorName": "Test Creator",
             "dateCreation": "'$(date --utc +%Y-%m-%dT%H:%M:%SZ)'"
           }')
  end=$(date +%s%3N)
  duration=$((end - start))
  echo "Recipe $i: Status $response, Time $duration ms"
done

total_end=$(date +%s%3N)
total_duration=$((total_start - total_end))
echo "Total time for creating 1000 recipes: $total_duration ms"
