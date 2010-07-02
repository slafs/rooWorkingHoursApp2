<#assign form=JspTaglibs['/WEB-INF/tlds/spring-form.tld']>

<h1>dupa dupa</h1>
<div id="footer">Footer
zażółć gęślą jaźń
<#assign test = "1">


<p>${test}</p>
<p>${hello}</p>

<@form.form commandName="faza">
	
	<@form.input path="name" />

	<input type="submit" value="OK" />
</@form.form>
</div>
