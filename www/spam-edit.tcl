ad_page_contract {
    edit a spam message that's already been inserted into the database.
    might be approved, might not.
} {
    spam_id:naturalnum,notnull
} -properties {
    plain_text:onevalue
    content:onevalue
    title:onevalue
    date_widget:onevalue
    time_widget:onevalue
    context_bar:onevalue
}

ad_require_permission $spam_id write

# grab the spam out of the table: with the most recent content revisions
db_1row spam_get_message {
    select header_subject as title, 
      to_char(send_date, 'yyyy-mm-dd') as send_date, 
      to_char(send_date, 'hh24:mi:ss') as send_time, 
      sql_query, sent_p, content_object_id
    from spam_messages_all
    where spam_id = :spam_id
}

# XXX: see if spam already sent; don't let user edit spam once it's sent,
# should view instead!

if {$sent_p == "t"} { 
    ad_returnredirect "[spam_base]spam-view?spam_id=$spam_id"
}

ad_set_client_property spam "sql_query" $sql_query

set num_recipients [db_string spam_get_num_recipients "
     select count(1) from ($sql_query)
"]

# XXX: cut-and-paste programming, should be a proc

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
    set plain_text ""
    set html_text ""
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

set date_widget [ad_dateentrywidget send_date $send_date]
set time_widget [spam_timeentrywidget send_time $send_time]
set confirm_target "spam-update"
set export_vars [export_form_vars spam_id num_recipients confirm_target]
set context_bar [ad_context_bar "Edit Spam"]

ad_return_template








