<#assign form=JspTaglibs['/WEB-INF/tlds/spring-form.tld']>
<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<@spring.url value="/pracownik/" var="form_url"/>
<@spring.message code="label.pracownik" var="label_pracownik"/>

<h2><@spring.message arguments="${label_pracownik}" code="global.menu.new"/> </h2>			

<@form.form action="${form_url}" method="POST" commandName="pracownik">
    <@form.errors cssClass="errors" delimiter="&lt;p/&gt;"/>
	<div>
		<@spring.message code="username" var="username_label"/>
		<@form.errors cssClass="errors" id="_username_error_id" path="username"/>
		<label for="_username_id">${username_label}:</label>
		<@form.input path="username" id="_username_id" maxlength="255" size="0" />
	</div>
	<br/>
	<div>
		<@spring.message code="firstname" var="firstname_label"/>
		<@form.errors cssClass="errors" id="_firstname_error_id" path="firstname"/>
		<label for="_firstname_id">${firstname_label}:</label>
		<@form.input path="firstname" id="_firstname_id" maxlength="255" size="0" />
	</div>
	<br/>
	<div>
		<@spring.message code="surname" var="surname_label"/>
		<@form.errors cssClass="errors" id="_surname_error_id" path="surname"/>
		<label for="_surname_id">${surname_label}:</label>
		<@form.input path="surname" id="_surname_id" maxlength="255" size="0" />
	</div>
	<br/>
	<div>
		<@spring.message code="email" var="email_label"/>
		<@form.errors cssClass="errors" id="_email_error_id" path="email"/>
		<label for="_email_id">${email_label}:</label>
		<@form.input path="email" id="_email_id" maxlength="255" size="0" />
	</div>
	<br/>
	<div>
		<@spring.message code="enabled" var="enabled_label"/>
		<@form.errors cssClass="errors" id="_enabled_error_id" path="enabled"/>
		<label for="_enabled_id">${enabled_label}?:</label>
		<@form.checkbox path="enabled" id="_enabled_id"/>
	</div>
    <br/>
	<div>
		<@spring.message code="password" var="password_label"/>
		<@form.errors cssClass="errors" id="_password_error_id" path="password"/>
		<label for="_password_id">${password_label}:</label>
		<@form.password cssClass="datefield" path="password" id="_password_id" maxlength="50" size="0" />
	</div>
	<br/>
	<div>
		<@spring.message code="authority" var="authority_label"/>
		<@form.errors cssClass="errors" id="_authority_error_id" path="authority"/>
		<label for="_authority_id">${authority_label}:</label>
		<@form.input path="authority" id="_authority_id" maxlength="255" size="0" />
	</div>
    <br/>
    <div>
		<@spring.message code="button.save" var="submit_label"/>
		<input type="submit" value="${submit_label}" />
 	</div>
	
</@form.form>

</div>