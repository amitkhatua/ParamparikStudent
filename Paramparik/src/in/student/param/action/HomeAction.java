/**
 * 
 */
package in.student.param.action;

import in.student.param.dto.StudentDTO;
import in.student.param.framework.ParamAbstractAction;
import in.student.param.util.ParamparikUtil;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

/**
 * @author amitk933
 *
 */
/*@InterceptorRef(value="loggingStack")
@Results({ @Result(name = "home", location = "/pages/s/home.jsp"),
	@Result(name = "list", location = "/pages/s/list.jsp"),
	@Result(name = "failure", location = "/pages/error.jsp"),
	@Result(name = "redirect", location = "${returnURL}", type = "redirect") })*/

public class HomeAction extends ParamAbstractAction{
	private static Logger logger = Logger.getLogger("HomeAction");
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String returnURL;
	private List<StudentDTO> regList = new ArrayList<StudentDTO>();
	
	//@Action(value = "/home")
	public String home(){
		
		logger.info("Enter home()");
		returnURL = "home";
		
		logger.info("Exit home()");
		return "home";
	}
	
	public String homeLanding(){
		
		logger.info("Enter homeLanding()");
		returnURL = "homeLand";
		
		logger.info("Exit homeLanding()");
		return "homeLand";
	}
	
//	@Action(value = "/regList")
	public String registrationList() {

		logger.info("Enter registrationList()");
		StudentDTO sDTO = new StudentDTO();
		try {
			//regList = StudentBusiness.getInstance().getStudentList(sDTO);
		} catch (Exception e) {
			logger.error("At registrationList(): error details-> "+ ParamparikUtil.getStackTraceAsString(e));
			addActionError(getText("System error occured. Please try again later."));
		}

		logger.info("Exit registrationList()");
		return "list";
	}

	
	
	

}
