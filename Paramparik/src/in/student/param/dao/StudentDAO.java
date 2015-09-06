/**
 * 
 */
package in.student.param.dao;

import in.student.param.constant.ParamQueryConstant;
import in.student.param.dto.StudentDTO;
import in.student.param.framework.ConnectionManager;
import in.student.param.framework.ParamException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

/**
 * @author amitk933
 * 
 */
public class StudentDAO {

	private static StudentDAO stduentDAO;
	private static Logger logger = Logger.getLogger("StudentDAO");

	private StudentDAO() {

	}

	public static StudentDAO getInstance() {
		if (stduentDAO == null) {
			stduentDAO = new StudentDAO();
		}
		return stduentDAO;
	}

	public List<StudentDTO> getStudentList(Connection conn,
			StudentDTO studentDTO) throws ParamException {

		logger.info("Enter getStduentList()");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StudentDTO> studentList = new ArrayList<StudentDTO>();
		try {
			pstmt = conn.prepareStatement(ParamQueryConstant.GET_STUDENT_LIST);
			// pstmt.setString(1, "ACTIVE");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StudentDTO sDTO = new StudentDTO();

				sDTO.setEnrolmentId(rs.getString("enrolment_id"));
				sDTO.setName(rs.getString("name"));
				sDTO.setDob(rs.getString("date_of_birth"));
				sDTO.setGender(rs.getString("gender"));
				sDTO.setCast(rs.getString("caste"));
				sDTO.setPermanentAddress(rs.getString("permanent_address"));
				sDTO.setParmanentPincode(rs.getString("parmanent_pincode"));
				sDTO.setPresentAddress(rs.getString("present_address"));
				sDTO.setPresentPincode(rs.getString("present_pincode"));
				sDTO.setEmailId(rs.getString("email_id"));
				sDTO.setContactNo(rs.getString("contact_no"));
				sDTO.setDateOfEnrolment(rs.getString("date_of_enrolment"));

				studentList.add(sDTO);
			}

		} catch (Exception e) {
			throw new ParamException(e.getMessage());
		} finally {
			ConnectionManager.close(null, null, null, pstmt);
		}

		logger.info("Exit getStduentList()");
		return studentList;
	}

	public StudentDTO getStudentDetails(Connection conn, StudentDTO sDTO) throws ParamException, SQLException {

		logger.info("Enter getStudentDetails()");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn.setAutoCommit(true);
			pstmt = conn.prepareStatement(ParamQueryConstant.GET_STUDENT_DETAILS);
			pstmt.setString(1, sDTO.getEnrolmentId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sDTO.setEnrolmentId(rs.getString("enrolment_id"));
				sDTO.setName(rs.getString("name"));
				sDTO.setDob(rs.getString("date_of_birth"));
				sDTO.setGender(rs.getString("gender"));
				sDTO.setCast(rs.getString("caste"));
				sDTO.setPermanentAddress(rs.getString("permanent_address"));
				sDTO.setParmanentPincode(rs.getString("parmanent_pincode"));
				sDTO.setPresentAddress(rs.getString("present_address"));
				sDTO.setPresentPincode(rs.getString("present_pincode"));
				sDTO.setEmailId(rs.getString("email_id"));
				sDTO.setContactNo(rs.getString("contact_no"));
				sDTO.setDateOfEnrolment(rs.getString("date_of_enrolment"));
			}

			
		} catch (Exception e) {
			throw new ParamException(e.getMessage());
		} finally {
			conn.setAutoCommit(false);
			ConnectionManager.close(null, null, null, pstmt);
		}
		logger.info("Exit getStudentDetails()");
		return sDTO;
	}

}
