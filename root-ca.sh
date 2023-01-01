#!/bin/sh

set -ex

# Create the root CA.

## Create the root directory for the root CA.
mkdir -p /tmp/root/ca

cd /tmp/root/ca

## Create the sub-directories and supporting files.

mkdir certs
mkdir crl
mkdir newcerts

mkdir private
chmod 700 private

touch index.txt
echo 1000 > serial

## Copy OpenSSL configuration file to root CA directory.
cp -v ./openssl.cnf /tmp/root/ca

## Create the root CA private key.
cd /tmp/root/ca

## TODO(ywen): Understand
openssl genrsa -aes256 -out private/ywen-ca.key.pem 4096

chmod 400 private/ywen-ca.key.pem
