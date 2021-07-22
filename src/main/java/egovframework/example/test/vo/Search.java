package egovframework.example.test.vo;

public class Search extends Pagination {
    
    private String searchType;
    private String keyword;
    private String[] words;

	public String[] getWords() {
		return words;
	}
	public void setWords(String[] words) {
		this.words = words;
	}
	public String getSearchType() {
        return searchType;
    }
    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }
    public String getKeyword() {
        return keyword;
    }
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
    
}