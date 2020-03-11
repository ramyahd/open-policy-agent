package commit.policy
import input as req
import data.commit.acl.roles
import data.commit.acl.role_bindings



default allow = false
#allow {
       
 #      access = acl[input.name]
  #     access[_] == input.branch_name
       #committer[_].name == input.committer.name
       #input.committer.branch_name == acl[input.committer[i].branch_name]
        # == input.committer.name
#}


allow {
  user_bindings = role_bindings[req.user][_]
  user_roles = roles[user_bindings]
  user_rules = user_roles[req.path]
  user_rules[_] = req.method
}


#foo[commit[i].metrics] {
 #   commit := acl[input.name]
  #  commit == input.name
   # committer = acl[input.branch_name]
    #committer[_] == input.brnach_name
    #commit[i].branch_name == input.committer.branch_name
    #commit[i].name == input.committer.name
    
    #}
