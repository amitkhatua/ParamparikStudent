/**
 * 
 */
package in.student.param.action;

import in.student.param.business.StudentBusiness;
import in.student.param.constant.ParamCommonBusiness;
import in.student.param.dto.DropDownDTO;
import in.student.param.dto.StudentDTO;
import in.student.param.dto.UserLoginDTO;
import in.student.param.framework.ParamAbstractAction;
import in.student.param.util.ParamparikUtil;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;


/**
 * @author amitk933
 *
 */
public class StudentAction extends ParamAbstractAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger("StudentAction");
	private StudentDTO studentDTO = new StudentDTO();
	private List<DropDownDTO> courseList = new ArrayList<DropDownDTO>();
	private List<DropDownDTO> instituteList = new ArrayList<DropDownDTO>();
	public String enrolmentNumber = null;

	public String newRegistration() {

		logger.info("Enter newRregistration()");
		studentDTO = new StudentDTO();
		try {
			courseList = ParamCommonBusiness.getInstance().populateDropdownList("course");
			instituteList = ParamCommonBusiness.getInstance().populateDropdownList("institute");
			studentDTO.setNewReg("true");
        } catch (Exception e) {
			logger.error("At newRregistration(): error details-> "+ ParamparikUtil.getStackTraceAsString(e));
			addActionError(getText("System error occured. Please try again later."));
		}

		logger.info("Exit newRregistration()");
		return "newReg";
	}
	
	
	
	public String getStudentDetails() {

		logger.info("Enter getStudentDetails()");
		String enrolmentId = studentDTO.getEnrolmentId();
		studentDTO = new StudentDTO();
		studentDTO.setEnrolmentId(enrolmentId);
		enrolmentNumber = enrolmentId;
		try {
			courseList = ParamCommonBusiness.getInstance().populateDropdownList("course");
			instituteList = ParamCommonBusiness.getInstance().populateDropdownList("institute");
            StudentBusiness.getInstance().getStudentDetails(studentDTO);
            studentDTO.setNewReg("false");

		} catch (Exception e) {
			logger.error("At getRegistrationDetails(): error details-> "+ ParamparikUtil.getStackTraceAsString(e));
			addActionError(getText("System error occured. Please try again later."));
		}

		logger.info("Exit getStudentDetails()");
		return "newReg";
	}
	
	public String newRregistrationSubmit() {

		logger.info("Enter newRregistrationSubmit()");
		try {
			courseList = ParamCommonBusiness.getInstance().populateDropdownList("course");
			instituteList = ParamCommonBusiness.getInstance().populateDropdownList("institute");
			UserLoginDTO user = (UserLoginDTO) this.getSession().get("loggedInUser");
			//sDTO.setUserLoginDTO(user);
			
			//StudentBusiness.getInstance().newRegSubmit(sDTO);
			addActionMessage(getText("Details has been successfully submitted for Enrolment Id - "+studentDTO.getEnrolmentId()));
			studentDTO = new StudentDTO();
		} catch (Exception e) {
			logger.error("At newRregistrationSubmit(): error details-> "+ ParamparikUtil.getStackTraceAsString(e));
			addActionError(getText("System error occured. Please try again later."));
		}
		
		logger.info("Exit newRregistrationSubmit()");
		return "newReg";
	}

	
	public void setCourseList(List<DropDownDTO> courseList) {
		this.courseList = courseList;
	}


	public List<DropDownDTO> getCourseList() {
		return courseList;
	}


	public void setInstituteList(List<DropDownDTO> instituteList) {
		this.instituteList = instituteList;
	}


	public List<DropDownDTO> getInstituteList() {
		return instituteList;
	}
	public StudentDTO getStudentDTO() {
		return studentDTO;
	}

	public void setStudentDTO(StudentDTO studentDTO) {
		this.studentDTO = studentDTO;
	}
	
	public String getEnrolmentNumber() {
		return enrolmentNumber;
	}

	public void setEnrolmentNumber(String enrolmentNumber) {
		this.enrolmentNumber = enrolmentNumber;
	}
	
}
