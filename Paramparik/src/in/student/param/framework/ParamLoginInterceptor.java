package in.student.param.framework;

import in.student.param.dto.UserLoginDTO;

import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * @author amitk933
 * 
 */
public class ParamLoginInterceptor implements Interceptor {

	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger("ParamLoginInterceptor");

	public String intercept(ActionInvocation invocation) throws Exception {
		logger.info("Entry at intercept()");
		String result = "invalid-session";
		String className = invocation.getAction().getClass().getName();
		long startTime = System.currentTimeMillis();
		logger.info("In method:: loggerinInterceptor:intercept():: Currently processing class--" + className);
		
		
		
		final Map<String, Object> sessionMap = invocation.getInvocationContext().getSession();
		UserLoginDTO loggedInUser = null;
		if (null != sessionMap) {
			loggedInUser = (UserLoginDTO) sessionMap.get("loggedInUser");
			// if the loggedInUser info present then proceed with the current action else redirect to the log out
			if (null != loggedInUser) {
				logger.info("In method:: LoginInterceptor:intercept():: loogedin user not null ", null);
				result = invocation.invoke();
			}
		}

		long endTime = System.currentTimeMillis();
		logger.info("After calling action: " + className + " Time taken: " + (endTime - startTime) + " ms");

		
		logger.info("Exit at intercept()");
		//result = invocation.invoke(); //to be removed once the session has been prepared
		return result;
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

}
