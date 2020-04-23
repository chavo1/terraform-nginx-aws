#!/usr/bin/env bash

PKGS="vim curl certbot nginx"

which ${PKGS} >>/dev/null || {
    sudo apt-get update
    sudo apt-get install -y ${PKGS}
}
