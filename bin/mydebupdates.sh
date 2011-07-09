#!/bin/bash

if [ -x /usr/bin/aptitude ] ; then
  NUM=$(aptitude search "~U" | wc -l)
  echo $NUM Updates Available
else
  echo No aptitude
fi
