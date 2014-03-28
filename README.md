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
`gulp watch` - start dev server, reload when files change

#### Start Test Server
1. `gulp karma` - inject bower deps into karma.conf
1. `karma start` - run all tests, rerun when files change
