  
package sonarrbac.policy


import input as req

import data.rbac.acl.roles
import data.rbac.acl.role_bindings

default allow = false

allow {
  user_bindings = role_bindings[req.user][_]
  user_roles = roles[user_bindings]
  user_rules = user_roles[req.path]
  
}


result[user_rules[_]]
{
  user_bindings = role_bindings[req.user][_]
  user_roles = roles[user_bindings]
  user_rules = user_roles[req.path]
  #user_rules = metric
}
