# Final project, system scalability


## MongoDB
### Test using endpoint POST, using 1000 datas

Steps:
- Open the terminal
- Verify existing create_recipes.sh file
- Give execution permissions "chmod +x create_recipes.sh"
- Run the file "./create_recipes.sh"

![Mongoatlas](image.png)

![mongoatlas2](image-2.png)

Results in terminal:

![termina](image-1.png)

### Test using endpoint GET by ID, using 1000 datas and ID = "667a443d6c156834d9b46da9"

Steps:
- Open the terminal
- Verify existing get_recipes.sh file
- Give execution permissions "chmod +x get_recipes.sh"
- Run the file "./get_recipes.sh"

![getrecipes](image-5.png)

### Test using endpoint PUT, using 1000 datas and ID = "667a443d6c156834d9b46da9"

Steps:
- Open the terminal
- Verify existing put_recipes.sh file
- Give execution permissions "chmod +x put_recipes.sh"
- Run the file "./put_recipes.sh"

![putrecipes](image-4.png)

### Test using endpoint DELETE, using 1000 datas and ID = "667a43f66c156834d9b46bdf"

Steps:
- Open the terminal
- Verify existing delete_recipes.sh file
- Give execution permissions "chmod +x delete_recipes.sh"
- Run the file "./delete_recipes.sh"

![deleterecipe](image-6.png)


### Final results in Mongo Atlas
![resultFinal](image-7.png)

Note: as you can see all actions are recorded in mongo atlas.
- The update was tried several times and as it failed it was also shown, but it was not taken as an update, but rather as a GET.