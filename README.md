# nakama-2.7.0-go-1.13-crash

This is a simple project showing the windows crash with Nakama 2.7.0 and Go 1.13 on Alpine 3.10.

Steps:

```
# Simple example (fails)
docker-compose -f docker-compose.yml build nakama
docker-compose -f docker-compose.yml up

# Alpine 3.10 Full build (fails)
docker-compose -f docker-compose.alpine310.yml build nakama
docker-compose -f docker-compose.alpine310.yml up

# Alpine 3.9.4 Full build (works)
docker-compose -f docker-compose.alpine39.yml build nakama
docker-compose -f docker-compose.alpine39.yml up

# Debian Buster Full build (works)
docker-compose -f docker-compose.buster.yml build nakama
docker-compose -f docker-compose.buster.yml up
```

The crash will appear in the console logs after the nakama container starts and attempts to load the plugin module.

System Info:

* Windows 10 1803
* Docker Desktop 2.1.0.4 (39773)
