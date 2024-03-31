# Used ports for localhost

# Postgres

Connect to database in the container
```shell
foo@bar:~$ echo "can use make shell-postgres command"
foo@bar:~$ echo "more commands inside cli here https://hasura.io/blog/top-psql-commands-and-flags-you-need-to-know-postgresql"
foo@bar:~$ docker exec -it postgres_database bash
# psql -h postgres_database -p 5432 -U postgres_user postgres_db
postgres# 
```

Create Postgres shell using Django + Makefile
```shell
foo@bar:~$ make database-shell
```

