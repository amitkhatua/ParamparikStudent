/**
 * 
 */
package in.student.param.framework;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

/**
 * @author amitk933
 * 
 */
public class ParamparikListner implements ServletContextListener {

	private static Logger logger = Logger.getLogger("ParamparikListner");

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		ServletContext ctx = arg0.getServletContext();
		//Properties paramparikProps = initparamparikProperties(ctx);
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		logger.info("in contextDestroyed :");
		ServletContext ctx = arg0.getServletContext();
		cleanupLog4j(ctx);
	}

	private void cleanupLog4j(ServletContext context) {
		context.log("Cleaning up Log4j resources for context: "+ context.getServletContextName() + "...");
		org.apache.log4j.LogManager.shutdown();
		context.log("Log4j cleaned up.");
	}

}
