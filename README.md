# cloud-microservices

A Robot Framework test suits for some cloud-microservices listed in this repository.

Running the test

```
robot -d results tests/CloudMicroservice.robot
robot -d results tests
robot -v LOOP:10 -d results tests
```

Creating a new local repository from command line.

```
git init
git add .
git commit -m "Initial commit"
git branch -m master main
git remote add origin  https://github.com/kumbirai/cloud-microservices
git remote -v
git push origin main
```