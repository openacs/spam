<master>
<property name="title">Show spam recipients</property>
<property name="context">@context;noquote@</property>
    
The following people are about to receive your spam:

<ul>
 <multiple name="spam_list">
 <if @spam_list.name@ nil>
   <li>@spam_list.email@
 </if>
 <else>
  <li>@spam_list.name@ (@spam_list.email@)
 </else>
 </multiple>
</ul>