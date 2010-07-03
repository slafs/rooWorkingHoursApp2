<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div id="menu">
<ul>
	<h2>
		<!-- Fazy pracy -->
		<@spring.message code="menu.category.web_mvc_jsp_faza_category.label"/>
	</h2>
	<li>
	<@spring.url value="/faza/form" var="create_faza_url"/>
	<a href="${create_faza_url}">
		<!-- Stwórz nową fazę -->
		<@spring.message code="label.faza" var="label_faza"/>
        <@spring.message arguments="${label_faza}" code="global.menu.new"/>			
	</a></li>
	<li>
	<@spring.url value="/faza" var="list_faza_url"/>
	<a href="${list_faza_url}">
		<!-- Przeglądaj fazy -->
		<@spring.message code="label.fazas" var="label_fazas"/>
		<@spring.message arguments="${label_fazas}" code="global.menu.list"/>
	</a></li>
</ul>
<ul>
	<h2>
		<!-- Fazy pracy -->
		<@spring.message code="menu.category.web_mvc_jsp_projekt_category.label"/>
	</h2>
	<li>
	<@spring.url value="/projekt/form" var="create_projekt_url"/>
	<a href="${create_projekt_url}">
		<!-- Stwórz nowy projekt -->
		<@spring.message code="label.projekt" var="label_projekt"/>
        <@spring.message arguments="${label_projekt}" code="global.menu.new"/>			
	</a></li>
	<li>
	<@spring.url value="/projekt" var="list_projekt_url"/>
	<a href="${list_projekt_url}">
		<!-- Przeglądaj projekty -->
		<@spring.message code="label.projekts" var="label_projekts"/>
		<@spring.message arguments="${label_projekts}" code="global.menu.list"/>
	</a></li>
</ul>

</div>