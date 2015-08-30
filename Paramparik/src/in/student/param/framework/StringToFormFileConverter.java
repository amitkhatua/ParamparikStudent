/**
 * 
 */
package in.student.param.framework;

import java.io.File;

import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

/**
 * @author amitk933
 *
 */
public class StringToFormFileConverter implements Converter{

	
	static {
		ConvertUtils.register(new StringToFormFileConverter(), File.class);
	}
	public StringToFormFileConverter() {
	}
	public Object convert(Class type, Object value) {
		if (value == null)
			return null;
		if (value instanceof String)
			return null;
		if (value instanceof String[])
			return null;
		if (value instanceof File)
			return value;
		else
			throw new ConversionException("Cannot convert " + type + " to FormFile");
	}

}
