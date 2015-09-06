/**
 * 
 */
package in.student.param.dto;

import java.io.Serializable;

/**
 * @author amitk933
 *
 */
public class StudentDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String enrolmentId; 
	private String name;
	private String dob;
	private String gender;
	private String cast;
	private String permanentAddress;
	private String parmanentPincode;
	private String presentAddress;
	private String presentPincode;
	private String emailId;
	private String contactNo;
	private String contactNoExtra;
	private String dateOfEnrolment;
	private String comment;
	private String newReg;


	public String getEnrolmentId() {
		return enrolmentId;
	}
	public void setEnrolmentId(String enrolmentId) {
		this.enrolmentId = enrolmentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public String getPermanentAddress() {
		return permanentAddress;
	}
	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}
	public String getParmanentPincode() {
		return parmanentPincode;
	}
	public void setParmanentPincode(String parmanentPincode) {
		this.parmanentPincode = parmanentPincode;
	}
	public String getPresentAddress() {
		return presentAddress;
	}
	public void setPresentAddress(String presentAddress) {
		this.presentAddress = presentAddress;
	}
	public String getPresentPincode() {
		return presentPincode;
	}
	public void setPresentPincode(String presentPincode) {
		this.presentPincode = presentPincode;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getContactNoExtra() {
		return contactNoExtra;
	}
	public void setContactNoExtra(String contactNoExtra) {
		this.contactNoExtra = contactNoExtra;
	}
	public String getDateOfEnrolment() {
		return dateOfEnrolment;
	}
	public void setDateOfEnrolment(String dateOfEnrolment) {
		this.dateOfEnrolment = dateOfEnrolment;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setNewReg(String newReg) {
		this.newReg = newReg;
	}
	public String getNewReg() {
		return newReg;
	}
	
}
