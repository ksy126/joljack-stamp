package cmd.service;

import java.util.Map;

public interface CmdService {
	
	public Object check_login(Map<String, Object> map);
	
	public void memberJoin(Map<String, Object> map);
	
}


