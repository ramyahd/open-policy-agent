  
package sonarrbac.policy


import input as req

import data.sonarrbac.acl.roles
import data.sonarrbac.acl.role_bindings
import data.sonarrbac.acl.access

default allow = false

#allow {
 # user_bindings = role_bindings[req.user][_]
 # user_roles = roles[user_bindings]
 # user_rules = user_roles[req.branch]
  
# }

deny[msg]
{ 
	  not allow 
    msg := "you are not authorized to check the result"
    
}

allow {
       # access = access["ramya"]
        #access[_] == input.access.user
        access[_] == access["req.auth"]
	}


result[user_rules[_]]
{
  allow
  user_bindings = role_bindings[req.user][_]
  user_roles = roles[user_bindings]
  user_rules = user_roles[req.branch]
  #user_rules = metric
}
