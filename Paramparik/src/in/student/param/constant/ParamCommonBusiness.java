/**
 * 
 */
package in.student.param.constant;

import in.student.param.dao.ParamCommonDAO;
import in.student.param.dto.DropDownDTO;
import in.student.param.framework.ConnectionManager;
import in.student.param.framework.ParamException;

import java.sql.Connection;
import java.util.List;

/**
 * @author amitk933
 * 
 */
public class ParamCommonBusiness {

	private static ParamCommonBusiness commonBusiness;

	private ParamCommonBusiness() {

	}

	public static ParamCommonBusiness getInstance() {
		if (commonBusiness == null) {
			commonBusiness = new ParamCommonBusiness();
		}
		return commonBusiness;
	}

	public List<DropDownDTO> populateDropdownList(String type) throws Exception {

		Connection connection = ConnectionManager.getConnection();
		List<DropDownDTO> dropdownList;
		try {
			dropdownList = ParamCommonDAO.getInstance().populateDropdownList(
					connection, type);
		} catch (ParamException e) {
			throw e;
		} finally {
			ConnectionManager.close(connection, null, null, null);
		}
		return dropdownList;
	}

}
