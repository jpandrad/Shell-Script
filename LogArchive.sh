#!/bin/bash
#
# Author: Joao Paulo de Andrade
# visit: www.jpandrade.com.br
#
# Function: Create a zip file for log archive and remove logs after zip.
#
GroupList=("GROUP-01" "GROUP-02" "GROUP-03")
RootDir="/Path/LogFolder/"
DateOfArchive=$(date --date "1 day ago" +%Y-%m-%d)

for i in ${GroupList[@]}
do
  find $RootDir$i/*.log -cmin -1440 | zip --junk-paths $RootDir$i/Archive/$DateOfArchive.zip -@
  find $RootDir$i/*.log -cmin -1440 -exec rm -fr {} \; > /dev/null 2>&1
done
