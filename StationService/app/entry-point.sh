#!/bin/sh
apk update
apk add --upgrade curl
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/bin sh
apk add curl
apk add bash
apk add gcompat
dotnet /app/StationService.dll
