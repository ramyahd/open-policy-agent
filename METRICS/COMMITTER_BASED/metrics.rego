package commit.policy
import input 
import data.commit.acl
import data.commit.acl



#default allow = false
#allow {
       
 #      access = acl[input.commiter[_]]
  #     access[_] == input.branch_name
       #committer[_].name == input.committer.name
       #input.committer.branch_name == acl[input.committer[i].branch_name]
        # == input.committer.name
#}


#foo[user_roles[req.branch_name[_]]]
#{
 # user_bindings = role_bindings[req.name][_]
  #user_roles = roles[user_bindings]
  #user_rules = user_roles[req.branch_name]
    
#}


foo[server] 
{
       some i,j
       server := acl[input.committer[_]]
       server[i].name == input.branch_name
       server[j].branch == input.name
       }
 #   commit := acl[input.name]
  #  commit == input.name
   # committer = acl[input.branch_name]
    #committer[_] == input.brnach_name
    #commit[i].branch_name == input.committer.branch_name
    #commit[i].name == input.committer.name
    
    #}
