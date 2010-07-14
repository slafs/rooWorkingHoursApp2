<#assign form=JspTaglibs['/WEB-INF/tlds/spring-form.tld']>
<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<@spring.url value="/raport/result" var="form_url"/>
<@spring.message code="label.raport" var="label_raport"/>

<h2><@spring.message arguments="${label_raport}" code="global.menu.new"/> </h2>			

<@form.form action="${form_url}" method="POST" commandName="raport">
    <@form.errors cssClass="errors" delimiter="&lt;p/&gt;"/>
	<div>
		<@spring.message code="name" var="name_label"/>
		<@form.errors cssClass="errors" id="_dateFrom_error_id" path="dateFrom"/>
		<label for="_dateFrom_id">${name_label}:</label>
		<@form.input path="dateFrom" class="datefield" id="_dateTo_id" maxlength="30" size="0" />
	</div>
    <br/>
	<div>
		<@spring.message code="name" var="name_label"/>
		<@form.errors cssClass="errors" id="_dateTo_error_id" path="dateTo"/>
		<label for="_dateTo_id">${name_label}:</label>
		<@form.input path="dateTo" class="datefield" id="_dateTo_id" maxlength="30" size="0" />
	</div>
    <br/>
    <div>
		<@spring.message code="button.proceed" var="submit_label"/>
		<input type="submit" value="${submit_label}" />
 	</div>
	
</@form.form>

</div>