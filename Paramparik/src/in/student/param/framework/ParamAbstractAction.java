/**
 * 
 */
package in.student.param.framework;

import in.student.param.dto.UserLoginDTO;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author amitk933
 * 
 */
public class ParamAbstractAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Map getSession() {
		ActionContext actionContext = ActionContext.getContext();

		Map<String, Object> session = new HashMap<String, Object>();
		if (null != actionContext) {
			session = actionContext.getSession();
		}

		return session;
	}

	
	public UserLoginDTO getLoginDetails()
	{
		Map<String,Object> session = this.getSession();
		UserLoginDTO loggedInUSer = null;

		if( null != session )
		{
			loggedInUSer = (UserLoginDTO)session.get("loggedInUser");
		}
		return loggedInUSer;
	}
}
