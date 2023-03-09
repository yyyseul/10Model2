<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

	<!-- autocomplete�� ���� �߰� -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>

	<c:if test="${!empty param.menu}">
		<c:choose>
			<c:when test="${param.menu eq 'manage'}">
				��ǰ ����
			</c:when>
			<c:when test="${param.menu eq 'search'}">
				��ǰ �����ȸ
			</c:when>
		</c:choose>
	</c:if>	

</title>

<!-- autocomplete�� ���� �߰� -->

	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">

	<link rel="stylesheet" href="/css/admin.css" type="text/css">


 	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		

<!-- CDN(Content Delivery Network) ȣ��Ʈ ���
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	<script type="text/javascript">
	
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		
		$("form").attr("method", "POST"). attr("action" , "/product/listProduct?menu=${param.menu}").submit();
		
	}
	
	$(function () {
		
		$("td.ct_btn01:contains('�˻�')").on("click", function () {
			fncGetList('1');
		});
		
		
		<c:choose>
			<c:when test="${param.menu eq 'manage'}">
			
				$(".ct_list_pop td:nth-child(3)").on("click", function () {
					var prodNo = $(this).children("input:hidden").val();
					
					alert("��ǰ��ȣ��? "+prodNo);
					self.location = "/product/updateProduct?prodNo="+prodNo;
					
				})
			
			</c:when>
			
			<c:when test="${param.menu eq 'search'}">
			
				$(".ct_list_pop td:nth-child(3)").on("click", function () {
					
					
					var prodNo = $(this).children("input:hidden").val();

					
					$.ajax(
							{
								url : "/product/json/getProduct/"+prodNo ,
								method : "GET",
								dataType : "json",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function (JSONData, status) {
									
									//Debug...
									//alert(status);
									//Debug...
									//alert("JSONData : \n"+JSONData);
									
									var displayValue = "<h3>"
																+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
																+"��ǰ�� : "+JSONData.prodName+"<br/>"
																+"��ǰ�̹��� : "+JSONData.fileName+"<br/>"
																+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
																+"�������� : "+JSONData.manuDate+"<br/>"
																+"���� : "+JSONData.price+"<br/>"
																+"������� : "+JSONData.regDateString+"<br/>"
																+"</h3>";
								$("h3").remove();
								$("#"+prodNo+"").html(displayValue);
								}
						});
					
				});
			
			</c:when>
		</c:choose>
		
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});	
		
	</script>
	
			<!-- autocomplete�� ���� �߰� -->
	<script type="text/javascript">
  $( function() {
	  
	  $.ajax( 
				{
					url : "/product/json/autocomplete" ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {

						//Debug...
						//alert(status);
						//Debug...
						//alert("JSONData : \n"+JSONData);
						
						var availableTags = JSONData;
						
						$( "#searchKeyword" ).autocomplete({
						      source: availableTags
						});
						
					}
				});

  } );
  </script>	
	


</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">


<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
				<c:if test="${!empty param.menu}">
					<c:choose>
						<c:when test="${param.menu eq 'manage'}">
							��ǰ ����
						</c:when>
						<c:when test="${param.menu eq 'search'}">
							��ǰ �����ȸ
						</c:when>
					</c:choose>
				</c:if>	
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
			
			<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
			<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
			<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			
			</select>
			<input type="text" name="searchKeyword" id="searchKeyword"
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  >
		</td>

		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td colspan="11" >��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">
			��ǰ��<br>
			<h7>(��ǰ�� click :  ������)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	
	<c:forEach var="product" items="${list}">
	
		<c:set var="i" value="${ i+1 }" />
		
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
				<td align="left">
				
					<input type=hidden value=${product.prodNo} >
			
					${product.prodName }
					
			<td></td>
		<td align="left">${product.price }</td>
		<td></td>
		<td align="left">${product.regDate }</td>
		<td></td>
		
		<c:if test="${product.proTranCode eq null || product.proTranCode.trim() eq '1' }">
			<td align="left">�Ǹ���</td>
		</c:if>
		
		<c:choose>
			<c:when test="${user.role eq 'user'}">
				<c:choose>
					<c:when test="${product.proTranCode.trim() eq '2'|| product.proTranCode.trim() eq '3' || product.proTranCode.trim() eq '4'}">
						<td align="left">������</td>
					</c:when>
				</c:choose>	
			</c:when>
			<c:when test="${user.role eq 'admin'}">
				<c:choose>
					<c:when test="${product.proTranCode.trim() eq '2' }">
						<td align="left">			
							�ǸſϷ� <a href="/product/updateTranCodeByProd?prodNo=${product.prodNo }&tranCode=${product.proTranCode.trim()}&currentPage=${resultPage.currentPage}"> ����ϱ�		
						</td>
					</c:when>
					<c:when test="${product.proTranCode.trim() eq '3'}">
						<td align="left">�����</td>
					</c:when>
					<c:when test="${product.proTranCode.trim() eq '4'}">
						<td align="left">��ۿϷ�</td>
					</c:when>
				</c:choose>	
			
			</c:when>
		
		</c:choose>
	</tr>
	<tr>
		<!--  <td colspan="11" bgcolor="D6D7D6" height="1"></td>-->
		<td id ="${product.prodNo }" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	
	</c:forEach>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
		<jsp:include page="../common/pageNavigator.jsp"/>	
    	</td>
	</tr>
</table>

</form>

</div>
</body>
</html>