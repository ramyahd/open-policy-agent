package sonarcode.policy

import input as req

import data.sonarcode.acl.roles
import data.sonarcode.acl.role_bindings
import data.sonarcode.acl.access

default hello =false
default approve = false

deny[msg]
{ 
    not hello 
    msg := "you are not authorized to check the result"
    
}

hello {
       # access = access["ramya"]
        #access[_] == input.access.user
        #access[_] == "ramya"
	 access[_] == req.auth
	}    


result[user_rules] {
    hello
    user_bindings = role_bindings[req.user][_]
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
    user_roles.Metrics[0].Vulnerability == req.vulnerability
    user_roles.Metrics[0].codecoverage <= req.codecoverage
    
}
