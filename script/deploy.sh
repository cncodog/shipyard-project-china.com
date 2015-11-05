#!/bin/bash

# shipyard 部署脚本

if [ "$1" != "" ] && [ "$1" = "-h" ]; then
    echo "Shipyard Deploy uses the following environment variables:"
    echo "  ACTION: this is the action to use (deploy, upgrade, node, remove)"
    echo "  DISCOVERY: discovery system used by Swarm (only if using 'node' action)"
    echo "  IMAGE: this overrides the default Shipyard image"
    echo "  PREFIX: prefix for container names"
    echo "  SHIPYARD_ARGS: these are passed to the Shipyard controller container as controller args"
    echo "  TLS_CERT_PATH: path to certs to enable TLS for Shipyard"
    echo "  PORT: specify the listen port for the controller (default: 8080)"
    echo "  PROXY_PORT: port to run docker proxy (default: 2375)"
    exit 1
fi

if [ -z "`which docker`" ]; then
    echo "You must have the Docker CLI installed on your \$PATH"
    echo "  See http://docs.docker.com for details"
    exit 1
fi
