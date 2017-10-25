#! /bin/bash

echo ${POOL:=stratum+tcp://xmr-asia1.nanopool.org:14444}
echo ${ADDRESS:=4BCeEPhodgPMbPWFN1dPwhWXdRX8q4mhhdZdA1dtSMLTLCEYvAj9QXjXAfF7CugEbmfBhgkqHbdgK9b2wKA6nqRZQCgvCDm}
echo ${PAYMENTID:=8d0ce94a3d2409ef1be551c90bbef00f438122be501bc7d2099cde2b46b3677b}
echo ${THREADS:=8}
echo ${WORKER:=$HOSTNAME}

./minerd \
    -o $POOL \
    -u $ADDRESS.$PAYMENTID.$WORKER \
    -p z --threads $THREADS