/**
 * 
 */
package in.student.param.dto;

/**
 * @author amitk933
 *
 */
public class DropDownDTO extends BaseDTO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String itemValue;
	private String itemLebel;
	
	public DropDownDTO(){
		
	}
	
	public DropDownDTO(String itemValue, String itemLebel) {
		super();
		this.itemValue = itemValue;
		this.itemLebel = itemLebel;
	}
	
	
	public String getItemValue() {
		return itemValue;
	}
	public void setItemValue(String itemValue) {
		this.itemValue = itemValue;
	}
	public String getItemLebel() {
		return itemLebel;
	}
	public void setItemLebel(String itemLebel) {
		this.itemLebel = itemLebel;
	}

}
