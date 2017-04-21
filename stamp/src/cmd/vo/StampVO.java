package cmd.vo;

public class StampVO {
	
	private String stamp_no;
	private String member_no;
	private String comapny_no;
	private String stamp_count;
	
	public String getStamp_no() {
		return stamp_no;
	}
	public void setStamp_no(String stamp_no) {
		this.stamp_no = stamp_no;
	}
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public String getComapny_no() {
		return comapny_no;
	}
	public void setComapny_no(String comapny_no) {
		this.comapny_no = comapny_no;
	}
	public String getStamp_count() {
		return stamp_count;
	}
	public void setStamp_count(String stamp_count) {
		this.stamp_count = stamp_count;
	}
	@Override
	public String toString() {
		return "StampVO [stamp_no=" + stamp_no + ", member_no=" + member_no + ", comapny_no=" + comapny_no
				+ ", stamp_count=" + stamp_count + "]";
	}
}
