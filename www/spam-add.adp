<master>
<property name="title">Create a New Spam</property>
<property name="context">@context;noquote@</property>

<p>This message will be sent to @num_recipients@ users. (<a href="spam-show-users">See list of recipients</a>)
</p>


<form action="spam-confirm" method="post">
@export_vars;noquote@

<include src="spam-form-body" 
	time_widget=@time_widget;noquote@ 
	date_widget=@date_widget;noquote@
>



<center><input type="submit" value="Send Spam"></center>

</form>



