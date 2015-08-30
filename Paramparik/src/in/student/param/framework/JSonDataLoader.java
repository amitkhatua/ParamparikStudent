/**
 * 
 */
package in.student.param.framework;

import in.student.param.dto.UserLoginDTO;
import in.student.param.util.ParamparikUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;

/**
 * @author amitk933
 *
 */
public class JSonDataLoader extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger("JSonDataLoader");
	
	public JSonDataLoader() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doAction(request, response);
		} catch (Exception e) {
			logger.error("At JSonDataLoader:doGet(): error details-> "+ ParamparikUtil.getStackTraceAsString(e));
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doAction(request, response);
		} catch (Exception e) {
			logger.error("At JSonDataLoader:doPost(): error details-> "+ ParamparikUtil.getStackTraceAsString(e));
		}
	}
	
	
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, Exception {
		
		String fieldCons = request.getParameter("fieldCons");
		if (ParamparikUtil.notNullOrEmpty(fieldCons) && "PRV_REG_CHECK".equalsIgnoreCase(fieldCons)) {
			isPrvRegistered(request, response);
		}
	}
	
	protected void isPrvRegistered(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		try {
			String regNo = request.getParameter("regNo");
			//call to business for any changes
			String jsonString = null;
			//Gson gson = new Gson();
				jsonString = "TRUE";
			//String json = gson.toJson(jsonString);
			out.print(jsonString);
			out.flush();
		} catch (Exception e) {
			logger.error("At isPrvRegistered(): error details-> "+ ParamparikUtil.getStackTraceAsString(e));
			String json = "ERROR";
			out.print(json);
			out.flush();
		}
	}
}
