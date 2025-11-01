#!/bin/bash
echo "User Report"
echo "Number of users: $(who | wc -l)"
echo "Free disk space: "
df -h
