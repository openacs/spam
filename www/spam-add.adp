<master>
<property name="title">Create a New Spam</property>

<h2>Create a New Spam</h2>

@navbar@

<hr>

<p>This message will be sent to @num_recipients@ users. (<a href="spam-show-users">See list of recipients</a>)
</p>


<form action="spam-confirm" method="post">
@export_vars@

<include src="spam-form-body" 
	time_widget=@time_widget@ 
	date_widget=@date_widget@
>



<center><input type="submit" value="Send Spam"></center>

</form>



