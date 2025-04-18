package vo;

import java.sql.Date;
import java.util.Objects;

public class Customer {
	private int custno;
	private String custname;
	private String phone;
	private String address;
	private Date date;
	private String grade;
	private String city;

	public Customer() {}

	public Customer(int custno, String custname, String phone, String address, Date date, String grade, String city) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.phone = phone;
		this.address = address;
		this.date = date;
		this.grade = grade;
		this.city = city;
	}

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public int hashCode() {
		return Objects.hash(address, city, custname, custno, date, grade, phone);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		return Objects.equals(address, other.address) && Objects.equals(city, other.city)
				&& Objects.equals(custname, other.custname) && custno == other.custno
				&& Objects.equals(date, other.date) && Objects.equals(grade, other.grade)
				&& Objects.equals(phone, other.phone);
	}

	@Override
	public String toString() {
		return "Customer [custno=" + custno + ", custname=" + custname + ", phone=" + phone + ", address=" + address
				+ ", date=" + date + ", grade=" + grade + ", city=" + city + "]";
	}

}
