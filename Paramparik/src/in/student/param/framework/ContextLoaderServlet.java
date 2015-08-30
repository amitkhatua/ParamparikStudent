/**
 * 
 */
package in.student.param.framework;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

/**
 * @author amitk933
 *
 */
public class ContextLoaderServlet extends HttpServlet{
	private static final long serialVersionUID = 3261326193612361L;
	private static Logger logger = Logger.getLogger("ContextLoaderServlet");

	
	public void init() throws ServletException {
		try {
			Class.forName("in.student.param.framework.StringToFormFileConverter");
		} catch (ClassNotFoundException exc) {
			logger.error("Error to load StringToFormFileConverter-> "+exc.getMessage());
			System.out.println("Error at ContextLoaderServlet-> during Loading StringToFormFileConverter");
			exc.printStackTrace();
		}

	}
}
