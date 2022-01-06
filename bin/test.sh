#!/bin/bash

set -ex

composer self-update

composer --version
phpunit --version

php -i
