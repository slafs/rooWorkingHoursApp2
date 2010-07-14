<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<@spring.message code="start" var="start"/>
<@spring.message code="term" var="term"/>
<@spring.message code="forwho" var="forwho"/>
<@spring.message code="description" var="projdesc"/>
<@spring.message code="enabled" var="enabled"/>
<@spring.message code="disabled" var="disabled"/>
<div>
<h2><@spring.message code="label.pracownik" /></h2>

<#escape x as x?html>
	<h3>${pracownik.id} - ${pracownik.username}</h3>
		<h4>${pracownik.firstname} ${pracownik.surname}</h4>
		<p>
			<#if pracownik.enabled>
				${enabled}
			<#else>
				${disabled}
			</#if>
		</p>
</#escape>
</div>

<@spring.url value="/pracownik/${pracownik.id}/form" var="update_url"/>
<@spring.message code="label.pracownik" var="entity_label"/>
<@spring.message  arguments="${entity_label}" code="entity.update" var="update_text" />
<@spring.url value="/pracownik" var="list_pracownik_url"/>
<@spring.message code="label.pracowniks" var="label_pracowniks"/>

<span class="links">
	<a href="${update_url}">${update_text}</a> |
</span>

<span class="links">
	<a href="${list_pracownik_url}">
		<@spring.message arguments="${label_pracowniks}" code="global.menu.list"/>
	</a>
</span>

</div>