package customer;

public class Prethaler_Customer {
	private int customerID;
	private String firstname;
	private double credit;
	
	/**
	 * @param customerID
	 * @param firstname
	 */
	public Prethaler_Customer(int customerID, String firstname, double credit) {
		super();
		this.customerID = customerID;
		this.firstname = firstname;
		this.credit = credit;
	}
	public int getCustomerID() {
		return customerID;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	public double getCredit() {
		return credit;
	}
	public void setCredit(double credit) {
		this.credit = credit;
	}
}
