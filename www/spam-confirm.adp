<!-- spam confirmation page -->

<master>
<property name="title">Confirm Spam</property>

<h2>Confirm Spam</h2>
@navbar@
<hr>

You are about to send the following message to @num_recipients@ users.  
(<a href="spam-show-users">See list of recipients</a>)

<p>
The mail will be sent on @pretty_date@ at @send_time.time@ @send_time.ampm@ 

</p>

<p>
<if @escaped_body_plain@ nil>(no plain text)</if>
<else>
in plain text: 

<blockquote>
@escaped_body_plain@
</blockquote>

</else>
</p>

<p>
<if @body_html@ nil>(no HTML)</if>
<else>
in HTML:

<blockquote>
@body_html@
</blockquote>

</else>
</p>

<form action="@confirm_target@" method="post">
@export_vars@
<center><input type="submit" value="Confirm"></center>
</form>










