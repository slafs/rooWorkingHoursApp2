<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<h2><@spring.message code="label.projekt" /></h2>

<#escape x as x?html>
	<h3>${projekt.id} - ${projekt.name}</h3>
</#escape>

<@spring.url value="/projekt/${projekt.id}/form" var="update_url"/>
<@spring.message code="label.projekt" var="entity_label"/>
<@spring.message  arguments="${entity_label}" code="entity.update" var="update_text" />
<@spring.url value="/projekt" var="list_projekt_url"/>
<@spring.message code="label.projekts" var="label_projekts"/>

	<a href="${update_url}">${update_text}</a> |
	 
	<a href="${list_projekt_url}">
		<@spring.message arguments="${label_projekts}" code="global.menu.list"/>
	</a>

</div>