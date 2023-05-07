#!/bin/sh

PASSPHRASE=${PASSPHRASE_ENV_VAR}

echo "${PASSFHRASE}" | gpg --batch --yes --passphrase-fd 0 --import ./keys/public-key.gpg
echo "${PASSFHRASE}" | gpg --batch --yes --passphrase-fd 0 --import ./keys/private-key.gpg
