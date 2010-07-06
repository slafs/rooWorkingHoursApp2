<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<@spring.message code="start" var="start"/>
<@spring.message code="term" var="term"/>
<@spring.message code="forwho" var="forwho"/>
<@spring.message code="description" var="projdesc"/>
<@spring.message code="in" var="invar"/>
<div>
<h2><@spring.message code="label.developer" /></h2>
<#escape x as x?html>
	<h3>${developer.id} - ${developer.pracownik.username} ${invar} ${developer.projekt.name}</h3>
</#escape>
</div>

<@spring.url value="/developer/${developer.id}/form" var="update_url"/>
<@spring.message code="label.developer" var="entity_label"/>
<@spring.message  arguments="${entity_label}" code="entity.update" var="update_text" />
<@spring.url value="/developer" var="list_developer_url"/>
<@spring.message code="label.developers" var="label_developers"/>

	<a href="${update_url}">${update_text}</a> |
	 
	<a href="${list_developer_url}">
		<@spring.message arguments="${label_developers}" code="global.menu.list"/>
	</a>

</div>