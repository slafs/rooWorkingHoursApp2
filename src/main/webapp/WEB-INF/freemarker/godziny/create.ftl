<#assign form=JspTaglibs['/WEB-INF/tlds/spring-form.tld']>
<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<@spring.url value="/godziny/" var="form_url"/>
<@spring.message code="label.godziny" var="label_godziny"/>

<h2><@spring.message arguments="${label_godziny}" code="global.menu.new"/> </h2>			

<@form.form action="${form_url}" method="POST" commandName="godziny">
    <@form.errors cssClass="errors" delimiter="&lt;p/&gt;"/>
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
		<@spring.message code="when" var="when_label"/>
		<@form.errors cssClass="errors" id="_when_error_id" path="whenWorked"/>
		<label for="_when_id">${when_label}:</label>
		<@form.input cssClass="datefield" path="whenWorked" id="_when_id" maxlength="30" size="0" />
	</div>
	<br/>
	<div>
		<table class="noborder"><tr><td>
		<@spring.message code="hours" var="hours_label"/>
		<@form.errors cssClass="errors" id="_hours_error_id" path="hours"/>
		<label for="_client_id">${hours_label}:</label>
		<@form.input path="hours" id="_hours_id" maxlength="2" size="0" />
		</td><td>
		<@spring.message code="minutes" var="minutes_label"/>
		<@form.errors cssClass="errors" id="_minutes_error_id" path="minutes"/>
		<label for="_minutes_id">${minutes_label}:</label>
		<@form.input path="minutes" id="_minutes_id" maxlength="2" size="0" />
		</td></tr></table>
	</div>
	<br/>
    <div>
		<@spring.message code="button.save" var="submit_label"/>
		<input type="submit" value="${submit_label}" />
 	</div>
	
</@form.form>

</div>