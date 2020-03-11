package commit.policy
import input
import data.commit.acl



default allow = false
allow {
        input.committer.name == acl[input.committer[i].name]
        
}

#foo[commit[i].metrics] {
 #   commit := acl[input.name]
  #  commit == input.name
   # committer = acl[input.branch_name]
    #committer[_] == input.brnach_name
    #commit[i].branch_name == input.committer.branch_name
    #commit[i].name == input.committer.name
    
    #}
