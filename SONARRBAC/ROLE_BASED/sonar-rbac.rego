  
package sonarrbac.policy


import input as req

import data.sonarrbac.acl.roles
import data.sonarrbac.acl.role_bindings

default allow = false

allow {
  user_bindings = role_bindings[req.user][_]
  user_roles = roles[user_bindings]
  user_rules = user_roles[req.branch]
  
}


result[user_rules[_]]
{
  user_bindings = role_bindings[req.user][_]
  user_roles = roles[user_bindings]
  user_rules = user_roles[req.branch]
  #user_rules = metric
}
