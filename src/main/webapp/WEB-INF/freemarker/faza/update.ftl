<#assign form=JspTaglibs['/WEB-INF/tlds/spring-form.tld']>
<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>
<@spring.message code="label.faza" var="entity_label"/>
<h2><@spring.message arguments="${entity_label}" code="entity.update"/></h2>

<@spring.url value="/faza/${faza.id}" var="form_url"/>
<@form.form action="${form_url}" method="PUT" commandName="faza">
    <@form.errors cssClass="errors" delimiter="&lt;p/&gt;"/>
	<div>
		<@spring.message code="name" var="name_label"/>
        <@form.errors cssClass="errors" id="_name_error_id" path="name"/>
		<label for="_name_id">${name_label}:</label>
		<@form.input path="name" id="_name_id" maxlength="30" size="0" />
	</div>
    <br/>
    <div>
		<@spring.message code="button.update" var="submit_label"/>
		<input type="submit" value="${submit_label}" />
	    <@form.hidden id="_id_id" path="id"/>
	    <@form.hidden id="_version_id" path="version"/>
	</div>
	
</@form.form>

</div>