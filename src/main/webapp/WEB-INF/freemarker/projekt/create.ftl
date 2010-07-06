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
		<@form.input path="name" id="_name_id" maxlength="255" size="0" />
	</div>
	<br/>
	<div>
		<@spring.message code="client" var="client_label"/>
		<@form.errors cssClass="errors" id="_name_error_id" path="client"/>
		<label for="_client_id">${client_label}:</label>
		<@form.input path="client" id="_client_id" maxlength="255" size="0" />
	</div>
	<br/>
	<div>
		<@spring.message code="start" var="start_label"/>
		<@form.errors cssClass="errors" id="_start_error_id" path="started"/>
		<label for="_client_id">${start_label}:</label>
		<@form.input cssClass="datefield" path="started" id="_start_id" maxlength="30" size="0" />
	</div>
    <br/>
	<div>
		<@spring.message code="term" var="term_label"/>
		<@form.errors cssClass="errors" id="_term_error_id" path="term"/>
		<label for="_term_id">${term_label}:</label>
		<@form.input cssClass="datefield" path="term" id="_term_id" maxlength="30" size="0" />
	</div>
	<br/>
	<div>
		<@spring.message code="description" var="desc_label"/>
		<@form.errors cssClass="errors" id="_desc_error_id" path="description"/>
		<label for="_desc_id">${desc_label}:</label>
		<@form.textarea path="description" id="_desc_id" size="0" />
	</div>
	<div>
		<@spring.message code="default_faza" var="def_faz_label"/>
		<@form.errors cssClass="errors" id="_defaultFaza_errors_id" path="defaultFaza"/>
		<label for="_defaultFaza_id">${def_faz_label}:</label>
		<@form.select cssStyle="width:250px" id="_defaultFaza_id" path="defaultFaza">
			<#list fazas as faza>
				<@form.option value="${faza.id}" label="${faza.name}"/>
			</#list>
	    </@form.select>
	</div>	
	
    <br/>
    <div>
		<@spring.message code="button.save" var="submit_label"/>
		<input type="submit" value="${submit_label}" />
 	</div>
	
</@form.form>

</div>