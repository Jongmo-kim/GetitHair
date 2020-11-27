package common;

public class PagingCommon {
	// Paging 기능관련
	// reqPage, maxSize : 표시될 최대 페이지, pageSize : 총 페이지
	// 페이지에 표시해야 할 시작번호와 끝번호를 반환 해줌.
	public static int[] getPageStartEnd(int reqPage, int maxSize, int pageSize) {
		int pageStart = 1; // 표시되는 시작 페이지
		int pageEnd = 1; // 표시되는 마지막 페이지
		for (int i = 1; i <= pageSize / maxSize + (pageSize % maxSize != 0 ? 1 : 0); i++) {
			if (i * maxSize >= reqPage) {
				pageStart = i * maxSize - (maxSize - 1);
				pageEnd = i * maxSize < pageSize ? i * maxSize : pageSize;
				break;
			}
		}
		return new int[] { pageStart, pageEnd };
	}
}
