#!/bin/sh
set -e 

user="$1"
token="$GITHUB_STATS_TOKEN"

query='query($login: String!){user(login:$login){repositoriesContributedTo{totalCount}pullRequests{totalCount}issues{totalCount}repositories(first:100,ownerAffiliations:OWNER,orderBy:{direction:DESC,field:STARGAZERS}){nodes{stargazerCount}}}}'
jsonPayload="{\"query\":\"$query\", \"variables\":{\"login\":\"$user\"}}"

output=$(curl -fsS -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $token" -d "$jsonPayload" https://api.github.com/graphql)

echo "Public Repo Stats:"
echo "$output" | jq -crf filter.jq