package in.student.param.util;
/**
 * 
 */


import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ResourceBundle;

/**
 * @author amitk933
 *
 */
public class ParamparikUtil {

	public static boolean notNullOrEmpty(String content) {
		boolean result = false;
		if (null != content && content.length() > 0) {
			result = true;
		}
		return result;
	}
	
	/*
	 * takes 19/02/2014 as input
	 * return sql date 19-FEB-2014
	 */

	public static Date getDateFromString(String strDate) throws ParseException {
		DateFormat formatter;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		return  new java.sql.Date( formatter.parse(strDate).getTime());
	}
	
	
	/*
	 * takes sql 19/02/2014-02-19 as input
	 * return string 19/02/2014
	 */

	public static String getStringFromDate(Date date) throws ParseException {
		if(null != date && !"".equals(date)){
			DateFormat formatter;
			formatter = new SimpleDateFormat("dd/MM/yyyy");
			return formatter.format(date);
		}else{
			return "";
		}
		
	}
	
	public static String getProperty(String key) throws Exception {
		String value = createResourceBundleFromSource().getString(key);
		return value;
	}
	
	public static ResourceBundle createResourceBundleFromSource() throws Exception{
            ResourceBundle applicationProp=null;
            applicationProp = ResourceBundle.getBundle("in.gov.cg.nrda.resources.filepath");
            return applicationProp;
	}
	
	/** 
     * Gets the exception stack trace in String object.
     * @param exception 
     * @return 
     */
    public static final String getStackTraceAsString(Throwable exception) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        pw.println();
        exception.printStackTrace(pw);
        return sw.toString();
    }
}
