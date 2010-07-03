<#assign form=JspTaglibs['/WEB-INF/tlds/spring-form.tld']>
<#assign spring=JspTaglibs['/WEB-INF/tlds/spring.tld']>

<div>
<#if fazas??>
	    <div id="_title_div">
		    <@spring.message code="label.faza" var="entity_label"/>
		    <@spring.message code="label.fazas" var="entity_label_plural"/>
		    <@spring.message arguments="${entity_label_plural}" code="entity.list.all" var="title_msg"/>
		    <@spring.message arguments="${entity_label}" code="entity.show" var="show_label"/>
		    <@spring.message arguments="${entity_label}" code="entity.delete" var="delete_label"/>
		    <@spring.message arguments="${entity_label}" code="entity.update" var="edit_label"/>
		    <@spring.message arguments="${entity_label}" code="entity.create" var="create_label"/>
			<h2>${title_msg}</h2>	    	
			<table>
				<thead>
					<tr>
					    <@spring.message code="name" var="head_name"/>
					    <@spring.message code="id" var="head_id"/>
					    <@spring.message code="operations" var="head_operations"/>				
						<td>${head_id}</td><td>${head_name}</td><td colspan="3">${head_operations}</td>
					</tr>
				</thead>
				<tbody>
					<#list fazas as faza>
						<tr>
							<#escape x as x?html>
								<td>${faza.id}</td><td>${faza.name}</td>
							</#escape>  
                            <@spring.url value="/faza/${faza.id}/form" var="update_form_url"/>
                            <@spring.url value="/static/images/update.png" var="update_image_url"/>							
                            <@spring.url value="/faza/${faza.id}" var="show_url"/>
                            <@spring.url value="/static/images/show.png" var="show_image_url"/>							
                            <@spring.url value="/faza/${faza.id}" var="delete_form_url"/>
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
						<td colspan="5">
                        <@spring.url value="/faza/form" var="create_form_url"/>
                        <@spring.url value="/static/images/add.png" var="create_image_url"/>							
						<a href="${create_form_url}"><img title="${create_label}" src="${create_image_url}"/></a>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
<#else>
	<p><@spring.message code="empty" /></p>	
</#if>
</div>