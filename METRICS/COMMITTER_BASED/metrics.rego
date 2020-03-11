package metrics.policy
import input
import data.metrics.acl

foo[commit[i].metrics] {
    commit := acl[input.name]
    commit[i].branch_name == input.committer.branch_name
    commit[i].name == input.committer.name
    
    }
