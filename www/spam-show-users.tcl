ad_page_contract {
    shows the list of users about to receive a spam message
} -properties {
    spam_list:multirow
}

set sql_query [ad_get_client_property "spam" "sql_query"]
set object_id [ad_get_client_property "spam" "object_id"]

if {$sql_query == ""} { 
    ad_return_complaint 1 "No user query supplied.  You can't invoke this \
	    page directly."
    return 
}

ad_require_permission $object_id write

db_multirow spam_list spam_get_party_list  "
    select email, first_names || ' ' || last_name as name
      from parties, ($sql_query) p2, persons
    where parties.party_id = person_id(+) 
      and p2.party_id = parties.party_id
"

ad_return_template

