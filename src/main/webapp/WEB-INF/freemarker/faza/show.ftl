<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<h2><@spring.message code="label.faza" /></h2>

<#escape x as x?html>
	<h3>${faza.id} - ${faza.name}</h3>
</#escape>

<@spring.url value="/faza/${faza.id}/form" var="update_url"/>
<@spring.message code="label.faza" var="entity_label"/>
<@spring.message  arguments="${entity_label}" code="entity.update" var="update_text" />
<@spring.url value="/faza" var="list_faza_url"/>
<@spring.message code="label.fazas" var="label_fazas"/>

	<a href="${update_url}">${update_text}</a> |
	 
	<a href="${list_faza_url}">
		<@spring.message arguments="${label_fazas}" code="global.menu.list"/>
	</a>

</div>