#!/bin/sh
cp inst /usr/local/sbin/
cp sinst /usr/local/sbin/
cp makelist_inst /usr/local/sbin/
cp inst.conf /etc/
echo "Running first time listmaking 'makelist_inst'"
/usr/local/sbin/makelist_inst
echo "Ready for abuse"
