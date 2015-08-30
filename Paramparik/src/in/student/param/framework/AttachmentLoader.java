/**
 * 
 */
package in.student.param.framework;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * @author amitk933
 * 
 */
public class AttachmentLoader extends HttpServlet {
	private static Logger logger = Logger.getLogger("AttachmentLoader");

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AttachmentLoader() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		try {
			doAction(request, response);
		} catch (Exception e) {

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		try {
			doAction(request, response);
		} catch (Exception e) {

		}
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String uuid = request.getParameter("uuid");
		String fileName = request.getParameter("fileName");
		String filePath = request.getParameter("filePath");
		ServletOutputStream outputStream = response.getOutputStream();
		String contentType = getServletContext().getMimeType(fileName);
		if (null != uuid && null != fileName) {
			String fname = null;
			String extn = null;
			byte[] fileContent = downloadAttachment(uuid, filePath, fileName);
			int mid = fileName.lastIndexOf(".");
			if (-1 != mid) {
				fname = fileName.substring(0, mid);
				extn = fileName.substring(mid + 1, fileName.length());
			}

			if (null != fileContent) {
				if (extn != null && !extn.equalsIgnoreCase("pdf")) {
					StringBuilder fileName1 = new StringBuilder(fname.trim().replace(" ", ""));
					fileName1.append(".");
					fileName1.append(extn);
					response.setHeader("Content-disposition", "attachment; filename=" + fileName1);
					outputStream.write(fileContent, 0, fileContent.length);
					outputStream.flush();
					outputStream.close();
				} else {
					response.setContentType(contentType);
					response.setHeader("Content-Disposition", " inline; filename=" + fileName);
					ServletOutputStream out = response.getOutputStream();
					out.write(fileContent);
					out.flush();
				}
			} else {
				outputStream.println("Requested file has been removed.");
				outputStream.flush();
			}
		} else {
			logger.error("At doAction() -> file name and file UUID can not be null ");
			outputStream.println("Requested file has been removed.");
			outputStream.flush();
		}

	}

	public byte[] downloadAttachment(String uuid, String filePath, String fileName) throws Exception {
		byte[] attachment = null;
		try {
			attachment = downloadAttachmentUid(uuid, filePath, fileName);
		} catch (IOException e) {
			logger.error("At downloadAttachment() -> exception ->" + e);
		}
		return attachment;
	}

	public byte[] downloadAttachmentUid(String uuid, String filePath, String fileName) throws Exception {
		
		//call for download attachment goes here
		
		return null;
	}

}
