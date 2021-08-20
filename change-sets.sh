#!/usr/bin/env bash

isAdminModified=false
isCorporateModified=false
isGatewayModified=false
isRetailModified=false

changeSets=(`git diff HEAD..$1 --name-status -- admin/library1 admin/service1`)
for(( i=0; i<${#changeSets[@]}; i++))
do
  if [ ${changeSets[$i]} == "M" ]
  then
    isAdminModified=True
  fi
done

changeSets=(`git diff HEAD..$1 --name-status -- corporate`)
for(( i=0; i<${#changeSets[@]}; i++))
do
  if [ ${changeSets[$i]} == "M" ]
  then
    isCorporateModified=True
  fi
done

changeSets=(`git diff HEAD..$1 --name-status -- gateway/service1 gateway/service2 gateway/service3`)
for(( i=0; i<${#changeSets[@]}; i++))
do
  if [ ${changeSets[$i]} == "M" ]
  then
    isGatewayModified=True
  fi
done

changeSets=(`git diff HEAD..$1 --name-status -- retail/library1 retail/library2 retail/service1 retail/service2`)
for(( i=0; i<${#changeSets[@]}; i++))
do
  if [ ${changeSets[$i]} == "M" ]
  then
    isRetailModified=True
  fi
done

echo $isAdminModified
echo $isCorporateModified
echo $isGatewayModified
echo $isRetailModified