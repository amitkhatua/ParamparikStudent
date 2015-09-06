/**
 * 
 */
package in.student.param.action;

import in.student.param.dto.UserLoginDTO;
import in.student.param.framework.ParamAbstractAction;
import in.student.param.util.ParamparikUtil;

import java.util.Map;

import org.apache.log4j.Logger;

/**
 * @author amitk933
 * 
 */

/*@Results({ @Result(name = "landing", location = "/pages/s/home.jsp"),
		@Result(name = "failure", location = "/pages/s/login.jsp"),
		@Result(name = "logout", location = "/pages/s/logout.jsp"),
		@Result(name = "landing", location = "/pages/s/login.jsp"),
		@Result(name = "redirect", location = "${returnURL}", type = "redirect") })*/
public class LoginAction extends ParamAbstractAction {

	/**
	 * 
	 */
	
	private static Logger logger = Logger.getLogger("LoginAction");
	
	private static final long serialVersionUID = 1L;
	private String returnURL;
	private String userLoginId;
	private String userPasswordID;

	//@Action(value = "/login")
	public String login() {
		logger.info("Enter at login()");

		boolean isUserPassCorrect = false;
		String failureMsg = "";
		
		if (!ParamparikUtil.notNullOrEmpty(userLoginId) || !ParamparikUtil.notNullOrEmpty(userPasswordID)) {
			failureMsg = "Username or Password cannot be blank";
			addActionError(getText(failureMsg));
			//uncomment this once the user cred implemented
			//return "failure";
		} else {
			//check user name password here
			/*try {
				isUserPassCorrect = ldapManager.authenticateUser(userLoginId, userPasswordID);
			} catch (ParamException e) {
				logger.error("LDAP Gives exception for User Creds-> "+ ParamparikUtil.getStackTraceAsString(e));
			}*/
			if (!isUserPassCorrect) {
				failureMsg = "Username and Password is invalid";
				addActionError(getText(failureMsg));
				//uncomment this once the user cred implemented
				//return "failure";
			}
	}

		if (isUserPassCorrect) {
		//if (true) {

			// populate user details here
			UserLoginDTO user = new UserLoginDTO();
			user.setUserLoginName(userLoginId);
			try {
				//LoginBusiness.getInstance().populateUserDetails(user);
				Map appSession = this.getSession();
				appSession.put("loggedInUser", user);
			} catch (Exception e) {
				logger.error("At login(): error details-> "+ ParamparikUtil.getStackTraceAsString(e));
				failureMsg = "Server has encountered an error. Please try logging after sometime.";
				addActionError(getText(failureMsg));
				return "failure";
			}

			returnURL = "home";
		} else {
			returnURL = "failure";
			addActionError(getText(failureMsg));
		}

		//delete this once the user cred implemented
		returnURL = "home";
		return returnURL;
	}

	//@Action(value = "/sessionTimeOut")
	public String sessionTimeOut() {
		logger.info("Enter at sessionTimeOut()");
		addActionError(getText("Your session has been expired. Kindly login again."));
		logger.info("Exit at sessionTimeOut()");
		return "failure";
	}

	//@Action(value = "/logout")
	public String logOut() {
		return "logout";
	}

	//@Action(value = "/landing")
	public String landing() {
		addActionMessage(getText("You have successfully logged out."));
		return "landing";
	}

	public String getReturnURL() {
		return returnURL;
	}

	public void setReturnURL(String returnURL) {
		this.returnURL = returnURL;
	}

	public String getUserLoginId() {
		return userLoginId;
	}

	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}

	public String getUserPasswordID() {
		return userPasswordID;
	}

	public void setUserPasswordID(String userPasswordID) {
		this.userPasswordID = userPasswordID;
	}

}
