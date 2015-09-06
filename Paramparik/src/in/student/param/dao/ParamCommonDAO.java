/**
 * 
 */
package in.student.param.dao;

import in.student.param.constant.ParamQueryConstant;
import in.student.param.dto.DropDownDTO;
import in.student.param.dto.UserLoginDTO;
import in.student.param.framework.ConnectionManager;
import in.student.param.framework.ParamException;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

/**
 * @author amitk933
 * 
 */
public class ParamCommonDAO {
	
	
	private static ParamCommonDAO paramCommonDAO;
	private static Logger logger = Logger.getLogger("ParamCommonDAO");
	private ParamCommonDAO(){
	}
	public static ParamCommonDAO getInstance() {
		if (paramCommonDAO == null) {
			paramCommonDAO = new ParamCommonDAO();
		}
		return paramCommonDAO;
	}
	

	public List<DropDownDTO> populateDropdownList(Connection conn, String type) throws ParamException {

		logger.info("Enter populateDropdownList()");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<DropDownDTO> courseList = new ArrayList<DropDownDTO>();
		try {
			if(type.equalsIgnoreCase("institute")){
				pstmt = conn.prepareStatement(ParamQueryConstant.GET_INSTITUTE_LIST);
			}else if(type.equalsIgnoreCase("course")){
				pstmt = conn.prepareStatement(ParamQueryConstant.GET_COURSE_LIST);
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DropDownDTO dropDownDTO = new DropDownDTO();
				dropDownDTO.setItemLebel(rs.getString("name"));
				dropDownDTO.setItemValue(rs.getString("id"));
				courseList.add(dropDownDTO);
			}
			
		} catch (Exception e) {
			throw new ParamException(e.getMessage());
		}finally {
			ConnectionManager.close(null, null, rs, pstmt);
		}

		logger.info("Exit populateDropdownList()");
		return courseList;
	}
}
