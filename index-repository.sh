#!/usr/bin/env sh
set -e

helm package --destination packages charts/*
helm repo index --url https://emagtechlabs.github.io/helm-charts/ .
