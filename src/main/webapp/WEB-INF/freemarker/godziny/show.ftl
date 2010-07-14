<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>

<@spring.message code="hours" var="hours"/>
<@spring.message code="minutes" var="minutes"/>
<@spring.message code="forwho" var="forwho"/>
<@spring.message code="in" var="invar"/>
<@spring.message code="entry" var="entry"/>
<@spring.message code="worked" var="worked" />

<div>
<h2><@spring.message code="label.godziny" /></h2>

<#escape x as x?html>
	<h3>${godziny.id}</h3>
	<h4>${godziny.pracownik.username} -  ${godziny.pracownik.firstname} ${godziny.pracownik.surname}</h4>
	<p>${godziny.whenWorked?date}</p>
	<p>${entry} ${forwho} ${godziny.projekt.name}</p>
	<p>${worked} <br />${hours}: ${godziny.hours},
	${minutes}: ${godziny.minutes}</p>

	<p />
</#escape>
</div>
<@spring.url value="/godziny/${godziny.id}/form" var="update_url"/>
<@spring.message code="label.godziny" var="entity_label"/>
<@spring.message  arguments="${entity_label}" code="entity.update" var="update_text" />
<@spring.url value="/godziny" var="list_godziny_url"/>
<@spring.message code="label.godzinys" var="label_godzinys"/>

	<span class="links"><a href="${update_url}">${update_text}</a></span> |
	
	<span class="links">
	<a href="${list_godziny_url}">
		<@spring.message arguments="${label_godzinys}" code="global.menu.list"/>
	</a>
	</span>

</div>