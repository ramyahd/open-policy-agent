package commit.policy
import input
import data.commit.acl



default allow = false
allow {
        access = acl[input.name]
        access[_] == input.branch_name
}

#foo[commit[i].metrics] {
 #   commit := acl[input.name]
  #  commit == input.name
   # committer = acl[input.branch_name]
    #committer[_] == input.brnach_name
    #commit[i].branch_name == input.committer.branch_name
    #commit[i].name == input.committer.name
    
    #}
