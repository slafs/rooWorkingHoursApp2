<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<@spring.message code="login" var="login"/>
<@spring.url  value="/j_spring_security_check" var="action_url" />


<h3>${login}</h3><form name='f' action='${action_url}' method='POST'>
 <table>
    <tr><td>User:</td><td><input type='text' name='j_username' value=''></td></tr>
    <tr><td>Password:</td><td><input type='password' name='j_password'/></td></tr>
    <tr><td colspan='2'><input name="submit" type="submit"/></td></tr>
    <tr><td colspan='2'><input name="reset" type="reset"/></td></tr>
  </table>

</form>