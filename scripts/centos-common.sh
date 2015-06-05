#!/bin/bash

# Update CentOS with any patches, excluding the kernel
yum update -y --exclude=kernel

# Install some tools
yum install -y nano git unzip screen nc telnet