# Development setup

Steps to setup development environment on MacOS

## RVM

Install RVM:

```
brew install gnupg
```

```
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```

```
\curl -sSL https://get.rvm.io | bash -s stable
```

`Restart terminal`

Setup instructions: https://rvm.io/

RVM basics: https://rvm.io/rvm/basics

RVM gemsets basics: https://rvm.io/gemsets/basics

Install ruby (2.7.4):

```
rvm install 2.7.4
rvm list
```

Use installed ruby version:

```
rvm 2.7.4
```

## Node and yarn

Install nvm

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

Install node and yarn

```
nvm install node
npm install --global yarn
yarn --version
```

## PostgreSQL setup

Install PostgreSQL

```
brew install postgresql@12
```

Add postgres(`/opt/homebrew/opt/postgresql@12/bin`) to PATH.

Create database

```
createdb builddco_development
```

## Rails

```
bundle install
```

Migrate database

```
bundle exec rake db:migrate
```

Create admin user from rails console. Reference: [trestle-auth](https://github.com/TrestleAdmin/trestle-auth)

```
rails console
```

```
User.create(email: "admin@example.com", password: "password", first_name: "Admin", last_name: "User")
```

Run yarn to install dependecies

```
yarn
```

### Start rails development server

There are 2 options:

In a single terminal tab run following command:

```
./bin/dev
```

Or

Run following commands in two separate terminal tabs:

```
yarn build:css --watch
```

```
rails server
```

Visit `http://localhost:3000/bd-auth` and login using admin credetials created above. Add some fake data.

Launch buildd at `http://localhost:3000`
