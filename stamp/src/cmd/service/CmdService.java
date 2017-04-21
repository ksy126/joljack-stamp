package cmd.service;

import java.util.Map;

import cmd.vo.StampVO;

public interface CmdService {
	
	public Object check_login(Map<String, Object> map);
	
	public void memberJoin(Map<String, Object> map);
	
	public StampVO stampInfo(Map<String, Object> map);
	
	public void saveStamp(Map<String, Object> map);
	
}


