<master>
<property name="title">Spam Queued</property>
<property name="context">@context@</property>

Success!  

<if @approved_p@ eq f> 
  <p> This message requires administrative approval before it will be sent.
</if>

<p>You can <a href="spam-edit?spam_id=@spam_id@">edit your message</a> 
before it gets sent out.


