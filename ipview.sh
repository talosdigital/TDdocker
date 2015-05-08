#!/bin/bash
clear
iptables -L -n -v
iptables -t nat -L -n

