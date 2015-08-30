/**
 * 
 */
package in.student.param.framework;

/**
 * @author amitk933
 *
 */
public class ParamException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ParamException(String errorId,String message) {
		super(errorId+message);
	}

	public ParamException(String errorId,Throwable cause) {
		super(errorId,cause);
	}
	

	public ParamException(String message) {
		super(message);
	}

	public ParamException(Throwable cause) {
		super(cause);
	}

}
