#!/bin/sh

export GOOGLE_APPLICATION_CREDENTIALS=/Users/arghya/zaphod-aaa.json

snsTopic=`aws2 sns list-topics --profile zaphodaaa --region us-east-1 | jq '.Topics[].TopicArn'`
IFS=$'\n'
for i in $snsTopic
do
  if [[ "$i" == *"topic-turbottest4353"* ]]
  then
  temp="${i%\"}"
  temp="${temp#\"}"
  deleteRes=`aws2 sns delete-topic --topic-arn "$temp" --profile zaphodaab --region us-east-1`
  fi
done