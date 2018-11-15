/**
 *
 */
package sailpoint.custom;

import java.util.List;

import sailpoint.api.SailPointContext;
import sailpoint.integration.RequestResult;
import sailpoint.object.Attributes;
import sailpoint.object.IntegrationConfig;
import sailpoint.integration.IntegrationExecutor;
import sailpoint.object.TaskResult;
import sailpoint.object.TaskSchedule;
import sailpoint.task.AbstractTaskExecutor;
import sailpoint.tools.GeneralException;
import sailpoint.tools.Message;
import sailpoint.integration.IntegrationManager;
import sailpoint.tools.Message;


/**
 * @author
 *
 */
public class RemedyInterrogator extends AbstractTaskExecutor {

    IntegrationExecutor _executor;
    IntegrationConfig _config;

	public void execute(SailPointContext context, TaskSchedule schedule, TaskResult result, Attributes<String, Object> args)
		throws Exception
	{
    	// The Remedy ticket ID we want to query
		// Updated by amit.
		// Updated by aditi.
		// Updated by amit again.
        String ticketId = (String) args.get("ticketId");
        String remedyConfig = (String) args.get("remedyConfig");

		try {

            _config = (IntegrationConfig)
                context.getObject(IntegrationConfig.class, remedyConfig);

            if (_config != null) {
                _config.load();
                _executor = IntegrationManager.getExecutor(_config);
                _executor.configure(context, _config);

                // invoke the getRequestStatus method
                RequestResult ticketStatus = _executor.getRequestStatus(ticketId);
                if (ticketStatus.isFailure()) {
                	// just grab the first one
                    @SuppressWarnings("unchecked")
                	List<Message> msgs = ticketStatus.getErrors();
                    //need to test Identityrequest status stuff which means
                    //sending back a failure status and we're getting nullpointers
                    //add some null checks and split out error message from status
                    if (msgs != null && !msgs.isEmpty()) {
                    	result.setAttribute("errorMessage", msgs.get(0));
                    } else {
                    	result.setAttribute("errorMessage", "No errors.");
                    }
                    if (ticketStatus.getStatus() != null)	{
                    	result.setAttribute("ticketStatus", ticketStatus.getStatus());
                    }
                } else {
                	if (ticketStatus.getStatus() != null)	{
                    	result.setAttribute("ticketStatus", ticketStatus.getStatus());
                    }
                }
            } else {
        		result.setAttribute("ticketStatus", "Remedy configuration, " + remedyConfig + ", not found.");
            }
		} catch(GeneralException ge){
			ge.printStackTrace();
			throw ge;
		}
	}

	public boolean terminate()
	{
		// TODO Auto-generated method stub
		return false;
	}
}
