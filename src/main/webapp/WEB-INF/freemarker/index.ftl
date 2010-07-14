<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div id="_title_id">
	<@spring.message var="app_name" code="application.name" />
	<@spring.message var="title" code="welcome.titlepane" arguments="${app_name}" />
	<h3><@spring.message code="welcome.h3" arguments="${app_name}" /></h3>
	<p><@spring.message code="welcome.text" /></p>
</div>
