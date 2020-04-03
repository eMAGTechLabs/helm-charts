#!/usr/bin/env sh

helm package --destination packages charts/*
helm repo index --url https://emagtechlabs.github.io/helm-charts/ .
