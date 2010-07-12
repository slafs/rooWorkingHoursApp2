<#assign form=JspTaglibs['/WEB-INF/tlds/spring-form.tld']>
<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>
<div>
	<p>Zażółć gęślą jaźń</p>
</div>
<div>
<#if godzinys??>
	    <div id="_title_div">
		    <@spring.message code="label.godziny" var="entity_label"/>
		    <@spring.message code="label.godzinys" var="entity_label_plural"/>
		    <@spring.message arguments="${entity_label_plural}" code="entity.list.all" var="title_msg"/>
		    <@spring.message arguments="${entity_label}" code="entity.show" var="show_label"/>
		    <@spring.message arguments="${entity_label}" code="entity.delete" var="delete_label"/>
		    <@spring.message arguments="${entity_label}" code="entity.update" var="edit_label"/>
		    <@spring.message arguments="${entity_label}" code="entity.create" var="create_label"/>
		    
		    <@spring.message code="worked" var="worked"/>
		    
			<h2>${title_msg}</h2>	    	
			<table>
				<thead>
					<tr>
						<td colspan="4"/><td colspan="2">${worked}</td><td colspan="3"/>
					</tr>
					<tr>
					    <@spring.message code="username" var="head_name"/>
					    <@spring.message code="label.projekt" var="head_project"/>
					    <@spring.message code="when" var="head_when"/>
					    <@spring.message code="hours" var="head_h"/>
					    <@spring.message code="minutes" var="head_m"/>
					    <@spring.message code="id" var="head_id"/>
					    <@spring.message code="operations" var="head_operations"/>				
						<td>${head_id}</td><td>${head_name}</td>
						<td>${head_when}</td>
						<td>${head_project}</td>
						<td>${head_h}</td>
						<td>${head_m}</td>
						<td colspan="3">${head_operations}</td>
					</tr>
				</thead>
				<tbody>
					<#list godzinys as godziny>
						<tr>
							<#escape x as x?html>
								<td>${godziny.id}</td>
								<td>${godziny.pracownik.username}</td>
								<td>${godziny.whenWorked}</td>
								<td>${godziny.projekt.name}</td>
								<td>${godziny.hours}</td>
								<td>${godziny.minutes}</td>
							</#escape>  
                            <@spring.url value="/godziny/${godziny.id}/form" var="update_form_url"/>
                            <@spring.url value="/static/images/update.png" var="update_image_url"/>							
                            <@spring.url value="/godziny/${godziny.id}" var="show_url"/>
                            <@spring.url value="/static/images/show.png" var="show_image_url"/>							
                            <@spring.url value="/godziny/${godziny.id}" var="delete_form_url"/>
                            <@spring.url value="/static/images/delete.png" var="delete_image_url"/>							
							<td><a href="${update_form_url}"><img title="${edit_label}" src="${update_image_url}"/></a></td>
							<td><a href="${show_url}"><img title="${show_label}" src="${show_image_url}"/></a></td>
							
							<td>
							<@form.form action="${delete_form_url}" method="DELETE">
								<input alt="${delete_label}" class="image" src="${delete_image_url}" title="${delete_label}" type="image" value="${delete_label}"/>
								<#if param??>
									<#if param.page??>
	                                    <input name="page" type="hidden" value="${param.page}"/>
	                                </#if>
	                                <#if param.size??>
	                                    <input name="size" type="hidden" value="${param.size}"/>
	                                </#if>
                                </#if>
                                
							</@form.form>
							</td>
						</tr>
					</#list>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9">
                        <@spring.url value="/godziny/form" var="create_form_url"/>
                        <@spring.url value="/static/images/add.png" var="create_image_url"/>							
						<a href="${create_form_url}"><img title="${create_label}" src="${create_image_url}"/></a>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>

<#else>
	<p>tutaj jeszcze nic nie ma</p>
</#if>
</div>