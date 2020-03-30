package httpapi.rbac

default hello =false
default approve = false
import input.role_bindings
import input.roles
import input.access

deny[msg]
{ 
	not hello 
    msg := "you are not authorized to check the result"
    
}

hello {
       # access = access["ramya"]
        #access[_] == input.access.user
        access[_] == "ramya"
	}    


result[user_rules] {
	hello
    user_bindings = role_bindings["Wolvorines"][_]
    user_roles = roles[user_bindings]
    user_rules = user_roles["Metrics"]  
  
}

approve
{
	 user_bindings = role_bindings["Wolvorines"][_]
    user_roles = roles[user_bindings] 
    user_roles.Metrics[0].Vulnerability == "1"
    user_roles.Metrics[0].codecoverage <= "90"
    
}
