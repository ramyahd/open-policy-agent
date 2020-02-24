package myapi.policy

import data.myapi.acl
import input

default allow = false
default gate = 50
allow {
        access = acl[input.user]
        access[_] == input.access
}
gate {
		gate = gate[input.user.quality-gate]
}