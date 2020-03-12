  
package httpapi.rbac


import input.roles
import input.role_bindings

default allow = false

allow {
  user_bindings = role_bindings["alice"][_]
  user_roles = roles[user_bindings]
  user_rules = user_roles["/master/"]
  
}


result[user_rules[_]]
{
  user_bindings = role_bindings["alice"][_]
  user_roles = roles[user_bindings]
  user_rules = user_roles["/master/"]
  #user_rules[_] = "GET"
}
