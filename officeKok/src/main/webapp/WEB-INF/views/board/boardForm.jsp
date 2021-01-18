<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="${pageContext.request.contextPath }/js/ckeditor/ckeditor.js"></script>
<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message}");
	</script>
</c:if>

<div>
	<form id="boardForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="postno" value="${postvo.postno}" /> <input
			type="hidden" name="bo_parent" value="${param.parent }" />
			<input type="hidden" name="posthide" value="${postvo.posthide}" />
			<input type="hidden" name="postdate" value="${postvo.postdate}" />
		<table class="table table-boaderd">
			<tbody>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<div>
						<input class="form-control col" type="text" required
							name="postsubject" value="${postvo.postsubject}" maxLength="120" /> <span
							class="">${errors.postsubject }</span>
					</div>
				</td>
			</tr>


			<tr>
				<th>첨부파일</th>
				<td colspan="3">
					<div>
						<c:set var="fileCount" value="1" />
						<c:if test="${not empty postvo.attatchList }">
							<c:forEach items="${postvo.attatchList }" var="attatch">
								<span data-postattno="${attatch.postattno }">
									${attatch.postattfilename } <a
									class="btn btn-danger mr-2 fileDelBtn">삭제</a>
								</span>
								<c:set var="fileCount" value="${fileCount+1 }" />
							</c:forEach>
						</c:if>
						<span id="newFileArea"> <c:forEach begin="${fileCount }"
								end="3" step="1">
								<input class="form-control mr-2" type="file" name="attatchFiles" />
							</c:forEach>
						</span> <span class="">${errors.attatchFiles }</span>
					</div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><textarea name="postcontent">${postvo.postcontent }</textarea>
					<span class="">${errors.postcontent }</span></td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="d-flex justify-content-center">
						<input type="submit" value="전송" class="btn btn-primary mr-3" /> <input
							type="reset" value="취소" class="btn btn-warning mr-3" /> 
							<input
							type="button" value="뒤로가기" class="btn btn-info"
							onclick="history.back();" />
					</div>
				</td>
			</tr>
			</tbody>
		</table>
	</form>
</div>
<script type="text/javascript" src="<c:url value='/js/board/boardForm.js'/>?${System.currentTimeMillis() }"></script>