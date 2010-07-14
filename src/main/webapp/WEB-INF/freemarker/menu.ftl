<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>
<#assign sec=JspTaglibs['/WEB-INF/tlds/spring-security.tld']>

<ul>
<@sec.authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	
	<li>
		<h2>
			<!-- godziny -->
			<@spring.message code="menu.category.web_mvc_jsp_godziny_category.label"/>
		</h2><ul>
		<li>
		<@spring.url value="/godziny/form" var="create_godziny_url"/>
		<a href="${create_godziny_url}">
			<!-- Stwórz nową godzinę -->
			<@spring.message code="label.godziny" var="label_godziny"/>
	        <@spring.message arguments="${label_godziny}" code="global.menu.new"/>			
		</a></li>
		<li>
		<@spring.url value="/godziny" var="list_godziny_url"/>
		<a href="${list_godziny_url}">
			<!-- Przeglądaj godziny -->
			<@spring.message code="label.godzinys" var="label_godzinys"/>
			<@spring.message arguments="${label_godzinys}" code="global.menu.list"/>
		</a></li>
	</ul></li>
	<li>
		<h2>
			<!-- godziny -->
			<@spring.message code="menu.category.web_mvc_jsp_raport_category.label"/>
		</h2><ul>
		<li>
		<@spring.url value="/raport" var="create_raport"/>
		<a href="${create_raport}">
			<!-- Stwórz raport -->
			<@spring.message code="makeraport"/>
		</a></li>
		
	</ul></li>
</@sec.authorize>


	<@sec.authorize ifAnyGranted="ROLE_ADMIN">

	<li>
		<h2>
			<!-- Fazy pracy -->
			<@spring.message code="menu.category.web_mvc_jsp_faza_category.label"/>
		</h2><ul>
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
	</ul></li>
	<li>
		<h2>
			<!-- Projekty -->
			<@spring.message code="menu.category.web_mvc_jsp_projekt_category.label"/>
		</h2><ul>
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
	</ul></li>
	<li>
		<h2>
			<!-- pracownicy -->
			<@spring.message code="menu.category.web_mvc_jsp_pracownik_category.label"/>
		</h2><ul>
		<li>
		<@spring.url value="/pracownik/form" var="create_pracownik_url"/>
		<a href="${create_pracownik_url}">
			<!-- Stwórz nowego pracownika -->
			<@spring.message code="label.pracownik" var="label_pracownik"/>
	        <@spring.message arguments="${label_pracownik}" code="global.menu.new"/>			
		</a></li>
		<li>
		<@spring.url value="/pracownik" var="list_pracownik_url"/>
		<a href="${list_pracownik_url}">
			<!-- Przeglądaj pracowników -->
			<@spring.message code="label.pracowniks" var="label_pracowniks"/>
			<@spring.message arguments="${label_pracowniks}" code="global.menu.list"/>
		</a></li>
	</ul></li>
	<li>
		<h2>
			<!-- developerzy -->
			<@spring.message code="menu.category.web_mvc_jsp_developer_category.label"/>
		</h2><ul>
		<li>
		<@spring.url value="/developer/form" var="create_developer_url"/>
		<a href="${create_developer_url}">
			<!-- Stwórz nowego developera -->
			<@spring.message code="label.developer" var="label_developer"/>
	        <@spring.message arguments="${label_developer}" code="global.menu.new"/>			
		</a></li>
		<li>
		<@spring.url value="/developer" var="list_developer_url"/>
		<a href="${list_developer_url}">
			<!-- Przeglądaj developerów -->
			<@spring.message code="label.developers" var="label_developers"/>
			<@spring.message arguments="${label_developers}" code="global.menu.list"/>
		</a></li>
	</ul></li>
</@sec.authorize>
</ul>
