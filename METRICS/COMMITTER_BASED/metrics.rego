package play
import input
import data.metrics.acl

foo[commit[i].metrics] {
    commit := acl[committer[_]]
    commit[i].branch_name == input.committer.branch_name
    commit[i].name == input.committer.name
    
    }
