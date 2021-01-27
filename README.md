# Resources
Telegram Channel [https://t.me/nod32trialKeys](https://t.me/nod32trialKeys)

Telegram Bot [https://t.me/EsetNod32TrialKeysBot](https://t.me/EsetNod32TrialKeysBot)

Website with TRIAL keys [https://nod32-trial-keys.site/](https://nod32-trial-keys.site/)

# Documentation
See [docs](/docs) folder

# ESET NOD32 Mirror Script
Script to create own eset mirror

# Requirements
- PHP
- nginx or other web-server
- unrar

# Installations
- copy nod32ms.conf.%lang% -> nod32ms.conf
- edit lines in nod32ms.conf

# If you have valid login:password
- set them into log/nod_keys.valid in format login:password:version

# Run
- run php update.php

# Debuging
- set in nod32ms.conf log_level = 5
- run php debuging_run.php to see all messages at console

# PHP modules
- curl
- fileinfo
- iconv
- mbstring
- openssl
- pcre
- SimpleXML
- sockets
- zlib
