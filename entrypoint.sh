#!/bin/sh

# rebuild esbuild for the base image for docker.
npm rebuild esbuild

# remove everything under node_modules folder under app to avoid conflict
rm -rf /project/app/node_modules/*

exec "$@"