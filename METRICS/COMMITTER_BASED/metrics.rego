package commit.policy
import input
import data.commit.acl.committer



default allow = false
allow {
       
       input.committer.name == committer[input.committer.name]
       #committer[_].name == input.committer.name
       #input.committer.branch_name == acl[input.committer[i].branch_name]
        # == input.committer.name
}

#foo[commit[i].metrics] {
 #   commit := acl[input.name]
  #  commit == input.name
   # committer = acl[input.branch_name]
    #committer[_] == input.brnach_name
    #commit[i].branch_name == input.committer.branch_name
    #commit[i].name == input.committer.name
    
    #}
