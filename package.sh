#!/bin/sh

set -xe

ROOT_DIR=$(pwd)
CHART_DIR="$ROOT_DIR/charts/nocodb/"
PUBLIC_DIR="$ROOT_DIR/public"

cd $CHART_DIR
helm dependency upgrade && helm dependency build

cd $PUBLIC_DIR
helm package $CHART_DIR
helm repo index --url https://elium.github.io/nocodb .
cd -
