/**
 * 
 */
package in.student.param.business;

import in.student.param.dao.StudentDAO;
import in.student.param.dto.StudentDTO;
import in.student.param.framework.ConnectionManager;
import in.student.param.framework.ParamException;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

/**
 * @author amitk933
 *
 */
public class StudentBusiness {

	private static StudentBusiness studentBusiness;
	private static Logger logger = Logger.getLogger("StudentBusiness");

	private StudentBusiness() {

	}

	public static StudentBusiness getInstance() {
		if (studentBusiness == null) {
			studentBusiness = new StudentBusiness();
		}
		return studentBusiness;
	}
	
	public List<StudentDTO> getStudentList(StudentDTO studentDTO) throws Exception {

		logger.info("Enter getStudentList()");
		Connection connection = ConnectionManager.getConnection();
		List<StudentDTO> studentList;
		try {
			studentList = StudentDAO.getInstance().getStudentList(connection, studentDTO);
		} catch (ParamException e) {
			throw e;
		} finally {
			ConnectionManager.close(connection, null, null, null);
		}

		logger.info("Exit getStudentList()");
		return studentList;
	}

	public StudentDTO getStudentDetails(StudentDTO sDTO) throws Exception {
		logger.info("Enter getStduentDetails()");
		Connection connection = ConnectionManager.getConnection();
		try {
			StudentDAO.getInstance().getStudentDetails(connection, sDTO);
			
		} catch (ParamException e) {
			try {
				if (null != connection)
					connection.rollback();
			} catch (SQLException e1) {
				throw new ParamException("At getStduentDetails()" + e1.getMessage());
			}
			throw e;
		} finally {
			ConnectionManager.close(connection, null, null, null);
		}

		logger.info("Exit getStduentDetails()");
		return sDTO;
	}
	
	
}
