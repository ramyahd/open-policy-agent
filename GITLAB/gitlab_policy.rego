
package gitlab.policy

# User attributes
user_attributes = {
    "alice": {"commits": 15, "role": "admin"},
    "bob": {"commits": 5, "role": "developer"}
}

# object attributes
object_attributes = {
    "master": {"admincan": "merge", "permission": "granted"},
    "feature": {"devcan": "merge", "permission": "granted"}
}

default allow = false

# Admin may merge if granted
allow {
    # lookup the user's attributes
    user := user_attributes[input.user]
    
    # check that the user is an admin
    user.role == "admin"
    
    # check whether given user can merge 
    object_attributes[input.ticker].admincan == "merge"
    
   # check permission
    object_attributes[input.ticker].permission == "granted"

}

