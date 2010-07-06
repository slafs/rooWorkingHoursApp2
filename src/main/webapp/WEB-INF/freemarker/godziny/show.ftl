<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<@spring.message code="start" var="start"/>
<@spring.message code="term" var="term"/>
<@spring.message code="forwho" var="forwho"/>
<@spring.message code="description" var="projdesc"/>
<div>
<h2><@spring.message code="label.godziny" /></h2>

<#escape x as x?html>
	<h3>${godziny.id} - ${godziny.name}</h3>
	<#if 1 < godziny.client?length> <h4>${forwho} ${godziny.client}</h4></#if>
	${start}: ${godziny.started}<br/>
	<#if godziny.term??>
		 ${term}: ${godziny.term}<br/>
	</#if>
	<#if 1 < godziny.description?length><br/>${projdesc}:<br/>${godziny.description}<br/></#if>
	<p />
</#escape>
</div>

<@spring.url value="/godziny/${godziny.id}/form" var="update_url"/>
<@spring.message code="label.godziny" var="entity_label"/>
<@spring.message  arguments="${entity_label}" code="entity.update" var="update_text" />
<@spring.url value="/godziny" var="list_godziny_url"/>
<@spring.message code="label.godzinys" var="label_godzinys"/>

	<a href="${update_url}">${update_text}</a> |
	 
	<a href="${list_godziny_url}">
		<@spring.message arguments="${label_godzinys}" code="global.menu.list"/>
	</a>

</div>