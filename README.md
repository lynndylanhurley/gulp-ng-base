# defsynth

## About

This app uses the following:

#### Languages
* [jade templates](http://jade-lang.com/)
* [stylus stylesheets](http://learnboost.github.io/stylus/)
* [coffeescript](http://coffeescript.org/)

#### Libraries
* [bootstrap](http://getbootstrap.com/)
* [nib](http://visionmedia.github.io/nib/)
* [jquery](http://jquery.com/)
* [angularjs](http://angularjs.org/)
* [angular-ui router](https://github.com/angular-ui/ui-router)
* [angular-strap](http://mgcrea.github.io/angular-strap/)
* [lodash](http://lodash.com/docs)
* [modernizr](http://modernizr.com/)

### Requirements
* nodejs
* cairo

### Installation
1. `brew install cairo` - for sprites
1. `export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig` - still for sprites
1. `npm install` - install all server-side deps
1. `bower install` - install all client-side deps

### Development

#### Start Dev Server
`gulp dev` - start dev server. use livereload for automatic refresh.

### Deployment

This assumes the following, where `ENV_NAME` is the name of the target `NODE_ENV` (`production`, `staging`, etc.)

1. An heroku app exists, and its git remote is named `ENV_NAME`
1. The heroku app has its `NODE_ENV` set to `ENV_NAME` (using `heroku config:set`)
1. there is an s3 bucket config defined in `config/ENV_NAME.yml`. see `config/production.yml.example` for an example configuration.

#### Push to heroku `production` env

`NODE_ENV=production gulp deploy`

#### Push to heroku `staging` env

`NODE_ENV=staging gulp deploy`


### Testing

Unit tests use karma + mocha. E2E Tests use protractor + mocha.

#### Unit Tests
`karma start` - runs all tests in `test/unit/**/*.coffee`

#### E2E Tests
`gulp test:e2e` - runs all tests in `test/e2e/**/*.coffee`
