ad_page_contract {
    view a given piece of spam
} {
    spam_id:integer,notnull
}

ad_require_permission $spam_id read

db_1row spam_get_message {
    select header_subject as title, 
           to_char(send_date, 'Month DD, YYYY HH:MI:SS') as send_date,
           content_object_id 
     from spam_messages_all
     where spam_id = :spam_id
}

set html_text ""
set plain_text ""

if [acs_mail_multipart_p $content_object_id] {
    foreach type {plain html} {
	db_1row spam_get_multipart_${type}_text "
	    select content 
	    from acs_mail_multipart_parts, acs_contents
	    where multipart_id = :content_object_id
	       and content_id = content_object_id
  	       and mime_type = 'text/$type'
	"
	set ${type}_text $content
    }
} else {
    db_1row spam_get_text {
	select content, mime_type
	  from acs_contents
	where content_id = :content_object_id
    }
    if {$mime_type == "text/plain"} {
	set plain_text $content
    } elseif {$mime_type == "text/html"} {
	set html_text $content
    } else {
	ad_return_error "invalid content type in spam: $mime_type"
    }
}     

set context_bar [ad_context_bar]

ad_return_template
