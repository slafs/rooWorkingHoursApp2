<#assign form=JspTaglibs['/WEB-INF/tlds/spring-form.tld']>
<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<@spring.url value="/developer/${developer.id}" var="form_url"/>
<@spring.message code="label.developer" var="label_developer"/>

<h2><@spring.message arguments="${label_developer}" code="entity.update"/> </h2>			

<@form.form action="${form_url}" method="PUT" commandName="developer">
    <@form.errors cssClass="errors" delimiter="&lt;p/&gt;"/>
	<div>
		<@spring.message code="label.pracownik" var="prac_label"/>
		<@form.errors cssClass="errors" id="_prac_errors_id" path="pracownik"/>
		<label for="_prac_id">${prac_label}:</label>
		<@form.select cssStyle="width:250px" id="_prac_id" path="pracownik">
			<#list pracowniks as pracownik>
				<@form.option value="${pracownik.id}" label="${pracownik.username} - ${pracownik.firstname} ${pracownik.surname}"/>
			</#list>
	    </@form.select>
	</div>	
    <br/>
	<div>
		<@spring.message code="label.projekt" var="projekt_label"/>
		<@form.errors cssClass="errors" id="_projekt_errors_id" path="projekt"/>
		<label for="_projekt_id">${projekt_label}:</label>
		<@form.select cssStyle="width:250px" id="_projekt_id" path="projekt">
			<#list projekts as projekt>
				<@form.option value="${projekt.id}" label="${projekt.name}"/>
			</#list>
	    </@form.select>
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