#!/bin/sh

# rebuild esbuild for the base image for docker.
npm rebuild esbuild

# remove everything under node_modules folder under app
rm -rf /project/app/node_modules/*

exec "$@"