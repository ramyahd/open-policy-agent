package sonarcode.policy

import input as req

import data.sonarcode.acl.roles
import data.sonarcode.acl.role_bindings
import data.sonarcode.acl.access

default auth =false
default approve =false

authorization[msg]
{ 
    not auth 
    msg := "you are not authorized to check the result"
}

sonarmetrics[msg1]
{
	not approve
	msg1 := "code coverage and vulnerabilites are not met"
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
    some i
    user_bindings = role_bindings[req.project][_]
    user_roles = roles[user_bindings]
    user_rules = user_roles[req.branch]
    user_rules[i].Vulnerability == req.vulnerability
    user_rules[i].codecoverage == req.codecoverage
}
