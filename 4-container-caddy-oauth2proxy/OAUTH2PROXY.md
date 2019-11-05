# OAUTH2PROXY

1. Create an OAuth App via <https://github.com/settings/developers>
1. For local development, set the `Authorization callback URL` to `http://localhost/oauth2/callback`
1. Set envirionment variables `CLIENT_ID` and `CLIENT_SECRET`. Preferably store them in a file `_/ENV.sh` (which is included in `.gitignore`).

```bash
# INSTALL
go get -u github.com/pusher/oauth2_proxy

# LIVE
UPSTREAM='http://127.0.0.1:2080/'
EMAIL_DOMAIN='*'
COOKIE_SECRET=$(openssl rand -hex 3);
PROVIDER='github'
CLIENT_ID='...'
CLIENT_SECRET='...'
# source _/ENV.sh

oauth2_proxy \
   --http-address="0.0.0.0:80" \
   --redirect-url="http://localhost/oauth2/callback" \
   --email-domain=${EMAIL_DOMAIN}  \
   --upstream=${UPSTREAM} \
   --cookie-secret=${COOKIE_SECRET} \
   --cookie-secure=true \
   --provider=${PROVIDER} \
   --client-id=${CLIENT_ID} \
   --client-secret=${CLIENT_SECRET}

# LOCAL
UPSTREAM='https://hello-echo.azurewebsites.net/'
EMAIL_DOMAIN='*'
COOKIE_SECRET=$(openssl rand -hex 3);
PROVIDER='github'
CLIENT_ID='...'
CLIENT_SECRET='...'
# source _/ENV.sh

oauth2_proxy \
   --http-address="0.0.0.0:80" \
   --redirect-url="http://localhost/oauth2/callback" \
   --email-domain=${EMAIL_DOMAIN}  \
   --upstream=${UPSTREAM} \
   --pass-host-header=false \
   --cookie-secret=${COOKIE_SECRET} \
   --cookie-secure=false \
   --provider=${PROVIDER} \
   --client-id=${CLIENT_ID} \
   --client-secret=${CLIENT_SECRET}
```

## Resources
- https://github.com/pusher/oauth2_proxy
- https://pusher.github.io/oauth2_proxy/
- https://pusher.github.io/oauth2_proxy/configuration
- https://pusher.github.io/oauth2_proxy/tls-configuration
