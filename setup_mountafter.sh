#!/bin/sh

env-update
source /etc/profile
export PS1="(chroot) $PS1"
