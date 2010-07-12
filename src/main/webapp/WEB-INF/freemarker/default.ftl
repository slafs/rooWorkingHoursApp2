<#assign tiles=JspTaglibs['/WEB-INF/tlds/tiles.tld']>

<html>
<head>

</head>
<body>
<p>raz</p>

<div width="200px">
	<@tiles.insertAttribute name="menu" />   
</div>
<div style="clear:both;" />
<div style="float:right;">
	<@tiles.insertAttribute name="body" />
</div>

<p>dwa</p>
</body>
</html>
