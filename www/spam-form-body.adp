<!-- common form components to spam add/edit pages -->

<table>
 <tr>
  <th valign="top" align="left">Message Subject</th>
  <td><input type="text" name="subject" size="30" 
	value="<if @title@ defined>@title@</if>">
 </tr>
 <tr>
  <th valign="top" align="left">Date/time to send message</th>
  <td>@date_widget@ &nbsp; @time_widget@</td>
 </tr>
 <tr>
  <th valign="top" align="left">Plain-text message body</th>
  <td><textarea name="body_plain" rows="20" cols="60"><if @plain_text@ defined>@plain_text@</if></textarea>
  </td>
 </tr>
 <tr>
  <th valign="top" align="left">HTML message body</th>
  <td><textarea name="body_html" rows="20" cols="60"><if @html_text@ defined>@html_text@</if></textarea>
  </td>
 </tr>
</table>
 
<p>
The message will be sent out with MIME type <code>multipart/alternative</code>,
with both plaintext and HTML parts, and the recipient's mail client should
display the appropriate body.
</p>

<ul>
 <li>If the text body is filled in and the HTML body is left blank, it
  will be sent as <code>text/plain</code>
 <li>If the HTML body is filled in and the text body is left blank,
 it will be sent as <code>text/html</code>
</ul>



  

