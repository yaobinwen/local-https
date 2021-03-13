# Local HTTPS

## Overview

Deploy a local HTTPS web service

## Security Consideration

The deployed HTTPS server is designed for development and testing, not for production use. Therefore, I checked in the private keys (but are encrypted by `ansible-vault`). You can replace the keys and certificates if you want to use your own (for example, when you want to use the ).
