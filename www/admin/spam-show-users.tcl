ad_page_contract {
    Show who the spam is going to be sent to

} {
    spam_id:integer,notnull
}

# why not use ../spam-show-users.tcl?  That page keys off of the
# sql query which may or may not match who the spam actually goes
# to (imagine sending to 'registered users', the spam is delayed
# by a day, and new users register.  The query won't jive with the
# recipients).  Instead we get the set of folks to mail from the
# acs_messages_outgoing table

set root [nsv_get acs_properties root_directory]
source "$root/packages/spam/www/spam-show-users.tcl"
return