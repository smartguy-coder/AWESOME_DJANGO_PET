################## POETRY VIRTUALENV ##################
# https://habr.com/ru/articles/593529/
# https://python-poetry.org/docs/basic-usage/

# build-win and build-unix use only for first creation!!!
.PHONY: build-win
build-win:
	python.exe -m pip install --upgrade pip
	pip install poetry
	poetry config --local virtualenvs.in-project true
	touch README.md
	poetry init -n
	poetry install


.PHONY: build-unix
build-unix:
	python3 -m pip install --upgrade pip
	pip3 install poetry
	poetry config --local virtualenvs.in-project true
	touch README.md
	poetry init -n
	poetry install


# create virtualenv from existing poetry.lock and pyproject.toml
.PHONY: create-virt-win
create-virt-win:  # after command activate virtualenv
	python.exe -m pip install --upgrade pip
	pip install poetry
	poetry install


.PHONY: create-virt-unix
create-virt-unix:  # after command activate virtualenv
	python3 -m pip install --upgrade pip
	pip3 install poetry
	poetry install

# add package for project requirements
.PHONY: install
install: # make install package='redis[hiredis]'
	poetry add ${package}
	poetry install

# add package for project development
.PHONY: install-dev
install-dev:  # make install-dev package='pytest'
	poetry add ${package} --group dev
	poetry install

################## DOCKER CONTAINERS ##################
## FOR DJANGO
.PHONY: migrations
migrations:
	docker-compose run --rm  web-app sh -c "python manage.py makemigrations"

.PHONY: migrate
migrate:
	docker-compose run --rm  web-app sh -c "python manage.py migrate"

.PHONY: su  # create superuser
su:
	docker-compose run --rm  web-app sh -c "python manage.py createsuperuser"

.PHONY: newapp
newapp:
	docker-compose run --rm  web-app sh -c "python manage.py startapp $(app)"

.PHONY: shell
shell:
	docker-compose run --rm  web-app sh -c "python manage.py shell"


## FOR POSTGRES
.PHONY: shell-postgres
shell-postgres:
	docker exec -it postgres_database bash

####################### TESTING #######################

.PHONY: checks
checks:
	@echo "Start check🐿"
	black .
	isort .
	flake8 .
	#pytest -v -s --cov='.'
	#coverage html --omit="*/test*" -d tests/coverage
