<#assign tiles=JspTaglibs['/WEB-INF/tlds/tiles.tld']>
<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>
<#assign sec=JspTaglibs['/WEB-INF/tlds/spring-security.tld']>

<@spring.url  value="/static/styles/style.css" var="styles_url" />
<@spring.url  value="/" var="main_url" />
<@spring.url  value="/j_spring_security_logout" var="logout_url" />
<@spring.message code="application.name" var="appname"/>
<@spring.message code="welcome.text" var="appdesc"/>
<@spring.message code="hello" var="hello"/>
<@spring.message code="logout" var="logout"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${appname}</title>
<link href="${styles_url}" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="wrapper">
	<div id="header-wrapper">
		<div id="header">
			<div id="logo">
				<h1><a href="${main_url}">${appname}</a></h1>
				<p>${appdesc}</p>
			</div>
			<div id="menu">
				<span>
					<@sec.authorize ifNotGranted="ROLE_USER,ROLE_ADMIN">
						<a href="${main_url}">login</a>
					</@sec.authorize>
				</span>
				<span>
					<@sec.authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
						${hello} <@sec.authentication property="principal.username" />,
					
						<a href="${logout_url}">${logout}</a>
					</@sec.authorize>
				</span>
				<!--
				<ul>
					<li class="current_page_item"><a href="#">Home</a></li>
					<li><a href="#">Blog</a></li>
					<li><a href="#">Photos</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Links</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				-->
			</div>
		</div>
	</div>
	<!-- end #header -->
	<div id="page">
		<div id="content">
			
			
			<div class="post">
			
				<!--
				<h2 class="title"><a href="#">Welcome to Enormous </a></h2>
				-->
				<p class="meta">
				 <span class="author"><a href="${main_url}"><@spring.message code="button.home"/></a></span>
				 <!--
				 <span class="date">July 07, 2010</span>&nbsp;
				 <span class="links"><a href="#" title="">Comments</a></span>
				 -->
				 </p>
				
				<div class="entry">
					<@tiles.insertAttribute name="body" />			
				</div>
			</div>
			<!--
			<div class="post">
				<h2 class="title"><a href="#">Lorem ipsum sed aliquam</a></h2>
				<p class="meta"><span class="author"><a href="#">Someone</a></span> <span class="date">July 07, 2010</span>&nbsp;<span class="links"><a href="#" title="">Comments</a></span></p>
				<div class="entry">
					<p>Sed lacus. Donec lectus. Nullam pretium nibh ut turpis. Nam bibendum. In nulla tortor, elementum vel, tempor at, varius non, purus. Mauris vitae nisl nec metus placerat consectetuer. Donec ipsum. Proin imperdiet est. Phasellus <a href="#">dapibus semper urna</a>. Pellentesque ornare, orci in consectetuer hendrerit, urna elit eleifend nunc, ut consectetuer nisl felis ac diam. Etiam non felis. Donec ut ante. In id eros. Suspendisse lacus turpis, cursus egestas at sem.  Mauris quam enim, molestie in, rhoncus ut, lobortis a, est.</p>
				</div>
			</div>
			<div class="post">
				<h2 class="title"><a href="#">Consecteteur hendrerit </a></h2>
				<p class="meta"><span class="author"><a href="#">Someone</a></span> <span class="date">July 07, 2010</span>&nbsp;<span class="links"><a href="#" title="">Comments</a></span></p>
				<div class="entry">
					<p>Sed lacus. Donec lectus. Nullam pretium nibh ut turpis. Nam bibendum. In nulla tortor, elementum vel, tempor at, varius non, purus. Mauris vitae nisl nec metus placerat consectetuer. Donec ipsum. Proin imperdiet est. Phasellus <a href="#">dapibus semper urna</a>. Pellentesque ornare, orci in consectetuer hendrerit, urna elit eleifend nunc, ut consectetuer nisl felis ac diam. Etiam non felis. Donec ut ante. In id eros. Suspendisse lacus turpis, cursus egestas at sem.  Mauris quam enim, molestie in, rhoncus ut, lobortis a, est.</p>
				</div>
				
			</div>
	
			<div id="about">
				<h2>Lorem ipsum dolor amet</h2>
				<p>Sed lacus. Donec lectus. Nullam pretium nibh ut turpis. Nam bibendum. In nulla tortor, <a href="#">elementum</a> vel, tempor at, varius non, purus. Mauris vitae nisl nec metus placerat consectetuer. Donec ipsum. Proin imperdiet est. Phasellus dapibus semper urna. Pellentesque ornare, orci in <a href="#">consectetuer hendrerit</a>, urna elit eleifend nunc, ut consectetuer nisl felis ac diam. </p>
			</div>
			-->
		</div>
		<!-- end #content -->
		<div id="sidebar">
			<@tiles.insertAttribute name="menu" />
			<!--
			<ul>
				<li>
					<h2>Search</h2>
					<div id="search" >
						<form method="get" action="#">
							<div>
								<input type="text" name="s" id="search-text" value="" />
								<input type="submit" id="search-submit" value="GO" />
							</div>
						</form>
					</div>
					<div style="clear: both;">&nbsp;</div>
				</li>
				<li>
					<h2>Aliquam tempus</h2>
					<p>Mauris vitae nisl nec metus placerat perdiet est. Phasellus dapibus semper consectetuer hendrerit.</p>
				</li>
				<li>
					<h2>Categories</h2>
					<ul>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
					</ul>
				</li>
				<li>
					<h2>Blogroll</h2>
					<ul>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
					</ul>
				</li>
				<li>
					<h2>Archives</h2>
					<ul>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
					</ul>
				</li>
			</ul>
			-->
		</div>
		<!-- end #sidebar -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end #page -->
</div>
<div id="footer">
	<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/"> CSS Templates</a>.</p>
</div>
<!-- end #footer -->
</body>
</html>
