package vo;

public class CustomerMoney {
	private String custno;
	private String custname;
	private String grade;
	private int sales;

	public String getCustno() {
		return custno;
	}

	public void setCustno(String custno) {
		this.custno = custno;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public CustomerMoney(String custno, String custname, String grade, int sales) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.grade = grade;
		this.sales = sales;
	}

	public CustomerMoney() {

	}
}
