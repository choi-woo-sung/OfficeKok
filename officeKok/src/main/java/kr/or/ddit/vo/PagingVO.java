package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PagingVO<T> implements Serializable {

	public PagingVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}

	private int totalRecord;
	private int currentPage;
	private int screenSize = 5;
	private int blockSize = 5;

	private int totalPage;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;

	private SearchVO searchVO; // 일반 검색
	private Integer boardno;
	private T searchDetail; // 상세 검색용

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = (totalRecord + (screenSize - 1)) / screenSize;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow = endRow - (screenSize - 1);

		endPage = (currentPage + (blockSize - 1)) / blockSize * blockSize;
		startPage = endPage - (blockSize - 1);
	}

	private final String PATTERN = "<a href='#' data-page='%d' class='%s'>%s</a>";

	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();
		endPage = totalPage < endPage ? totalPage : endPage;
		if (startPage > blockSize) {
			html.append(String.format(PATTERN, (startPage - blockSize), "previous", "이전"));
		}
		for (int page = startPage; page <= endPage; page++) {
			if (currentPage == page) {
				html.append(String.format(PATTERN, page, "current", page));
			} else {
				html.append(String.format(PATTERN, page, "", page));
			}
		}
		if (endPage < totalPage) {
			html.append(String.format(PATTERN, (endPage + 1), "next", "다음"));
		}
		return html.toString();
	}

//	<nav aria-label="...">
//	  <ul class="pagination">
//	    <li class="page-item disabled">
//	      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
//	    </li>
//	    <li class="page-item"><a class="page-link" href="#">1</a></li>
//	    <li class="page-item active" aria-current="page">
//	      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
//	    </li>
//	    <li class="page-item"><a class="page-link" href="#">3</a></li>
//	    <li class="page-item">
//	      <a class="page-link" href="#">Next</a>
//	    </li>
//	  </ul>
//	</nav>

	private final String BT_PATTERN = "<li class='page-item %s' %s>" + "<a class='page-link' href='#' %s>%s</a>"
			+ "</li>";
	private final String DATAPAGE = "data-page='%d'";

	public String getPagingHTML_BS() {
		StringBuffer html = new StringBuffer();
		html.append("<div class='text-center'>");
		html.append("<nav aria-label='Page navigation'>");
		html.append("<ul class='pagination' style='justify-content: center;'>"); // pagination 가운데 정렬
		String liClass = startPage > blockSize ? "" : "disabled"; // 'previous, <<, 이전' 비활성화
		String liAddAttr = "";
		String aAddAttr = startPage > blockSize ? String.format(DATAPAGE, (startPage - blockSize)) // true이면 이전 블록의
																									// startPage로 이동
				: "tabindex='-1' aria-disabled='true'"; // false면 현재 하는 역할은 없음
		String aText = "<i class='fas fa-lg fa-angle-double-left'></i>";
		html.append(String.format(BT_PATTERN, liClass, liAddAttr, aAddAttr, aText)); // 이전Block의 첫번째 페이지로 이동
		endPage = totalPage < endPage ? totalPage : endPage; // Block의 마지막 페이지
		for (int page = startPage; page <= endPage; page++) {
			liClass = page == currentPage ? "active" : ""; // 만드는 페이지가 선택된 페이지면 active로 만든다.
			liAddAttr = page == currentPage ? "aria-current='page'" : ""; // 만드는 페이지가 선택된 페이지면 aria-current='page'라는걸
																			// 붙여준다.
			aAddAttr = String.format(DATAPAGE, page); // 페이지 번호를 부여해준다. data-page=page
			aText = page == currentPage ? page + "<span class='sr-only'>(current)</span>" : (page + "");
			html.append(String.format(BT_PATTERN, liClass, liAddAttr, aAddAttr, aText));
		}
		liClass = endPage < totalPage ? "" : "disabled"; // 블록의 마지막페이지가 토탈 페이지를 넘어가면 비활성화
		liAddAttr = "";
		aAddAttr = endPage < totalPage ? String.format(DATAPAGE, (endPage + 1)) // true이면 다음 블록의 start페이지로 이동
				: "tabindex='-1' aria-disabled='true'";
		aText = "<i class='fas fa-lg fa-angle-double-right'></i>";
		html.append(String.format(BT_PATTERN, liClass, liAddAttr, aAddAttr, aText)); // 다음Block의 첫번째 페이지로 이동
		html.append("</ul>");
		html.append("</nav>");
		html.append("</div>");
		return html.toString();
	}
}