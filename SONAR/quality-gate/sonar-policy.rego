package sonarcode.policy

import input as req

import data.sonarcode.acl.roles
import data.sonarcode.acl.role_bindings
import data.sonarcode.acl.access

default auth =false
default approve = false

deny[msg]
{ 
    not auth 
    msg := "you are not authorized to check the result"
    
}
auth {
       # access = access["ramya"]
        #access[_] == input.access.user
        #access[_] == "ramya"
	 access[_] == req.auth
	}    


result[user_rules] {
    auth
    user_bindings = role_bindings[req.project][_]
    user_roles = roles[user_bindings]
    user_rules = user_roles[req.branch]
    #user_bindings = role_bindings["Wolvorines"][_]
    #user_roles = roles[user_bindings]
    #user_rules = user_roles["Metrics"]  
  
}

approve
{
    user_bindings = role_bindings[req.user][_]
    user_roles = roles[user_bindings]
    user_rules = user_roles[req.branch]
    user_rules[_].Vulnerability == "1"
    user_rules[_].codecoverage == "90"
}
