#!/bin/bash

ping -c 1 www.thinkdatalabs.com >> thinkdata.log 2>&1 #append the values 
ping -c 1 www.thinkdatalabs.com > thinkdata.log 2>&1 #overwrite the values
ping -c 1 www.thinkdatalabs.com 2>> thinkdata_errors.log #append only errors
ping -c 1 www.thinkdatalabs.com 2> thinkdata_errors.log #overwrite only errors  
ping -c 1 www.thinkdatalabs.com &> thinkdata_all.log #overwrite both output and errors
ping -c 1 www.thinkdatalabs.com &>> thinkdata_all.log #append both output and errors
