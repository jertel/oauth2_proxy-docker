# oauth2_proxy-docker
Dockerfile for the oauth2_proxy SSO proxy

## Auto-recycling
This Dockerfile will forcibly restart the proxy after a default of 2 minutes, so that htpasswd file can be reloaded. 
If this is not used then override this default by passing in the AUTO_RESTART_SECONDS environment variable to the docker
run command. For example, to restart once a year instead of every 2 minutes:

```
docker run --rm -e AUTO_RESTART_SECONDS=31536000 -it jertel/oauth2_proxy-docker
```
