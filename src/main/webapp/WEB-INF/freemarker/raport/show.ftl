<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<h2><@spring.message code="label.raport" /></h2>

<@spring.message code="worked" var="worked"/>
<@spring.message code="hours" var="h"/>
<@spring.message code="minutes" var="m"/>

<#escape x as x?html>
	<h3>${raport.pracownik.username} ${worked}
	${raport.hoursWorked} ${h}, ${raport.minutesWorked} ${m}</h3>
</#escape>

<@spring.url value="/raport" var="update_url"/>
<@spring.message code="label.raport" var="entity_label"/>
<@spring.message  arguments="${entity_label}" code="makeanother" var="update_text" />

	<span class="links">
		<a href="${update_url}">${update_text}</a>
	</span>

</div>