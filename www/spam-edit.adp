<master>
<property name="title">Edit an outgoing spam</property>
<property name="context">@context@</property>

<form action="spam-confirm" method="post">
@export_vars@
 <include src="spam-form-body" 
	plain_text=@plain_text@
	html_text=@html_text@
	title=@title@
	date_widget=@date_widget@
	time_widget=@time_widget@>

<center><input type="submit" value="Edit Spam"></center>
</form>