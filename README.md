# ENV
* ruby
* rbenv
* ruby-build
* sqlite3

----------------------

# docker run

* mac book 15
```
docker build -t yongwoon/ruby-engine-app .

# 初回
docker run -it --name ruby-engine -p 8000:8000 -v /Users/yongwoon/Desktop/yongwoon/source/00_private/ruby/rails_engine:/app yongwoon/ruby-engine-app

# 2回目 ?
docker start ruby-engine
docker stop ruby-engine
```

* mac book 13

```
docker build -t yongwoon/ruby-engine-app .

# 初回
docker run -it --name ruby-engine -p 8000:8000 -v /Users/yongwoon.kim/Desktop/yongwoon/source/private/ruby/docker_ruby_sqlite3:/app yongwoon/ruby-engine-app

# 2回目 ?
docker start ruby-engine
docker stop ruby-engine
```

-----------------------

# docker commit

```
docker attach yongwoon/ruby-engine
docker commit ruby-engine yongwoon/ruby-engine:v1.0
```

----------------------

# prcess in docker (rails engine)

```
gem install rails
rails plugin new blorgh --mountable
```

* In blorgh root directory
```
bundle install
```

* Change code (blorgh.gemspec)
```
spec.add_development_dependency "sqlite3"
->
spec.add_development_dependency "sqlite3", '~> 1.3.6'
```

* exec rails server
```
rails s -p 8000 -b '0.0.0.0'
```

* Access url
```
http://0.0.0.0:8000/blorgh
```

------------------

# push to repository(Not need this time...)

```
docker login
docker build --tag=yongwoon/ruby-engine-app .
docker push yongwoon/ruby-engine-app
```
