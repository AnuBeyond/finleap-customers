# Finleap-Customer README

Demo deployment of this app can be found [finleap-customers](https://finleap-customers.herokuapp.com)

## System Dependencies

**ruby 2.6.3**

**rails 5.2.4**

**PostgreSQL 12.3**


## Configurations

Below configurations will guide you to have a running version of this project in your local Environment for testing and further development.

### Cloning the Repository

```
git clone git@github.com:AnuBeyond/finleap-customers.git
```

### Install dependencies

```
bundle install
npm install
```

### Set Environment Variables

```
EDITOR=vim rails credentials:edit
```

```
development:
  postgres:
   username: ''
   password: ''

test:
  postgres:
   username: ''
   password: ''
```

### Initialize the database

```
rails db:create
```

### Run Tests

below commands will initialize and run all unit tests

```
RAILS_ENV=test rails db:create
rspec spec
```

## Deployment instructions

### With [Heroku](https://www.heroku.com/)

prerequisite: Heroku Account.

* install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) first

* cd into your project folder

```shell
heroku login
```

* create a new heroku app

```shell
heroku create <your app name>
```

* set git remote to your newly created app

```shell
git remote set-url heroku https://git.heroku.com/<your app name>.git
```

* we need two build packs for this app. Read [this artical](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app) for reference.

```shell
heroku buildpacks:set heroku/ruby
heroku buildpacks:add --index 1 heroku/nodejs
```

* now push your app

```shell
git push heroku master
```

* if you're pushing a branch other than master, use below command

```shell
git push heroku <your branch>:master
```

* as we use reails credentials, we should first export our master key

```shell
heroku config:set RAILS_MASTER_KEY= <your master key>
```

* now let's migrate the database

```shell
heroku run rails db:create
```


### finally you can visit your project website through this URL

```shell
https://<your app name>.herokuapp.com
```

### you can visit admin & management panel through this URL

```shell
https://dashboard.heroku.com/apps/<your app name>
```
