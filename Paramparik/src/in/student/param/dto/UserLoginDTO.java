/**
 * 
 */
package in.student.param.dto;

import java.io.Serializable;

/**
 * @author amitk933
 *
 */
public class UserLoginDTO implements Serializable{

private static final long serialVersionUID = 1L;
	
	private String userLoginName;
	private String userId;
	private String userFullName;
	private String mobNo;
	private String emailId;
	
	
	public String getUserLoginName() {
		return userLoginName;
	}
	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserFullName() {
		return userFullName;
	}
	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}
	public String getMobNo() {
		return mobNo;
	}
	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
}
