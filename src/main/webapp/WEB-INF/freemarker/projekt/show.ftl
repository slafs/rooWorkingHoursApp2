<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<@spring.message code="start" var="start"/>
<@spring.message code="term" var="term"/>
<@spring.message code="forwho" var="forwho"/>
<@spring.message code="description" var="projdesc"/>
<div>
<h2><@spring.message code="label.projekt" /></h2>

<#escape x as x?html>
	<h3>${projekt.id} - ${projekt.name}</h3>
	<#if 1 < projekt.client?length> <h4>${forwho} ${projekt.client}</h4></#if>
	${start}: ${projekt.started}<br/>
	<#if projekt.term??>
		 ${term}: ${projekt.term}<br/>
	</#if>
	<#if 1 < projekt.description?length><br/>${projdesc}:<br/>${projekt.description}<br/></#if>
	<p />
</#escape>
</div>

<@spring.url value="/projekt/${projekt.id}/form" var="update_url"/>
<@spring.message code="label.projekt" var="entity_label"/>
<@spring.message  arguments="${entity_label}" code="entity.update" var="update_text" />
<@spring.url value="/projekt" var="list_projekt_url"/>
<@spring.message code="label.projekts" var="label_projekts"/>

<span class="links">
	<a href="${update_url}">${update_text}</a> |
</span>

<span class="links">
	<a href="${list_projekt_url}">
		<@spring.message arguments="${label_projekts}" code="global.menu.list"/>
	</a>
</span>

</div>