<#assign form=JspTaglibs['/WEB-INF/tlds/spring-form.tld']>
<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<@spring.url value="/projekt/" var="form_url"/>
<@spring.message code="label.projekt" var="label_projekt"/>

<h2><@spring.message arguments="${label_projekt}" code="global.menu.new"/> </h2>			

<@form.form action="${form_url}" method="POST" commandName="projekt">
    <@form.errors cssClass="errors" delimiter="&lt;p/&gt;"/>
	<div>
		<@spring.message code="name" var="name_label"/>
		<@form.errors cssClass="errors" id="_name_error_id" path="name"/>
		<label for="_name_id">${name_label}:</label>
		<@form.input path="name" id="_name_id" maxlength="30" size="0" />
	</div>
    <br/>
    <div>
		<@spring.message code="button.save" var="submit_label"/>
		<input type="submit" value="${submit_label}" />
 	</div>
	
</@form.form>

</div>