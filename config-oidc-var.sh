#!/usr/bin/env bash

sed -i "s#SERVER_FQDN#$SERVER_FQDN#"                                                /etc/nms/nginx/oidc/openid_configuration.conf
sed -i "s#OIDC_AUTH_ENDPOINT#$OIDC_AUTH_ENDPOINT#"                                  /etc/nms/nginx/oidc/openid_configuration.conf
sed -i "s#OIDC_TOKEN_ENDPOINT#$OIDC_TOKEN_ENDPOINT#"                                /etc/nms/nginx/oidc/openid_configuration.conf
sed -i "s#OIDC_KEYS_ENDPOINT#$OIDC_KEYS_ENDPOINT#"                                  /etc/nms/nginx/oidc/openid_configuration.conf
sed -i "s#OIDC_USERINFO_ENDPOINT#$OIDC_USERINFO_ENDPOINT#"                          /etc/nms/nginx/oidc/openid_configuration.conf
sed -i "s#OIDC_END_SESSION_ENDPOINT#$OIDC_END_SESSION_ENDPOINT#"                    /etc/nms/nginx/oidc/openid_configuration.conf
sed -i "s#OIDC_CLIENT_CREDENTIALS_TOKEN_BODY#$OIDC_CLIENT_CREDENTIALS_TOKEN_BODY#"  /etc/nms/nginx/oidc/openid_configuration.conf
sed -i "s#OIDC_CLIENT_ID#$OIDC_CLIENT_ID#"                                          /etc/nms/nginx/oidc/openid_configuration.conf
sed -i "s#OIDC_CLIENT_SECRET#$OIDC_CLIENT_SECRET#"                                  /etc/nms/nginx/oidc/openid_configuration.conf
sed -i "s#OIDC_HMAC_KEY#$OIDC_HMAC_KEY#"                                            /etc/nms/nginx/oidc/openid_configuration.conf

nginx -s reload
