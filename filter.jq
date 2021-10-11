.data.user |
["Stars Earned:", (.repositories.nodes | map(.stargazerCount) | add)],
["Total PRs:", .pullRequests.totalCount],
["Total Issues:", .issues.totalCount],
["Contributed to:", .repositoriesContributedTo.totalCount] | 
@tsv