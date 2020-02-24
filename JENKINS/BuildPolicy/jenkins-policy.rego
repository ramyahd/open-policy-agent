package myrego
import data.myapi.acl
import input
default allow=false

allow{
	access = acl[input.user]
	some i
	access[i] == input.access
}

