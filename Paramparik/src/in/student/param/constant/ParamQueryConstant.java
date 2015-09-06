/**
 * 
 */
package in.student.param.constant;

/**
 * @author amitk933
 *
 */
public class ParamQueryConstant {
	
	public static final String GET_STUDENT_LIST = "select * from students";
	public static final String GET_COURSE_LIST = "SELECT COURSE_ID AS id, COURSE_NAME AS name FROM t_course_master WHERE IS_ACTIVE = 'Y'";
	public static final String GET_INSTITUTE_LIST = "SELECT INSTITUTE_ID AS id, INSTITUTE_NAME AS NAME FROM t_institute_master WHERE IS_ACTIVE = 'Y'";
	public static final String GET_STUDENT_DETAILS = "SELECT * FROM students WHERE enrolment_id = ?"; 
	

}
