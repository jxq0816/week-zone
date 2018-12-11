<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻维度管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
            $("#btnExport").click(function(){
                top.$.jBox.confirm("确认要导出新闻维度数据吗？","系统提示",function(v,h,f){
                    if(v=="ok"){
                        $("#searchForm").attr("action","${ctx}/dimension/news/export");
                        $("#searchForm").submit();
                    }
                },{buttonsFocus:1});
                top.$('.jbox-body .jbox-icon').css('top','55px');
            });
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/dimension/news/">新闻维度列表</a></li>
		<shiro:hasPermission name="dimension:news:edit"><li><a href="${ctx}/dimension/news/form">新闻维度添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="news" action="${ctx}/dimension/news/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li class="btns">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
				<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>ID</th>
				<th>标题</th>
				<th>URL</th>
				<th>更新人</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="dimension:news:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="news">
			<tr>
				<td>${news.campaignId}
				</td>

				<td><a href="${ctx}/dimension/news/form?id=${news.id}">
					${news.title}
				</a></td>

				<td><a href="${news.url}">
						${news.url}
				</a></td>

				<td>
						${news.createBy.id}
				</td>

				<td>
					<fmt:formatDate value="${news.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${news.remarks}
				</td>
				<shiro:hasPermission name="dimension:news:edit"><td>
    				<a href="${ctx}/dimension/news/form?id=${news.id}">修改</a>
					<a href="${ctx}/dimension/news/delete?id=${news.id}" onclick="return confirmx('确认要删除该新闻维度吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>