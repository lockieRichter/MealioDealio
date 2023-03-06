#!/bin/zsh

### Utility script to open the local development database with an iOS simulator
### If the user has installed the db browser for sqlite app (mac only) it will
### open the DB using that, otherwise it will open the sqlite CLI. To install
### the sqlite GUI run the following command.
### brew install --cask db-browser-for-sqlite
### Assumes one instance of the app running only.

mobileDev_appId=com.lockierichter.mealioDealio
mobileDev_database=database.db

vared -p "App Id > " mobileDev_appId
vared -p "Database name > " mobileDev_database

APP=/Applications/DB\ Browser\ for\ SQLite.app
if test "$APP"
then
    open $APP $(find $(xcrun simctl get_app_container booted $mobileDev_appId data) -name $mobileDev_database)
else
    sqlite3 $(find $(xcrun simctl get_app_container booted $mobileDev_appId data) -name $mobileDev_database)
fi
