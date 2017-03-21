package cmd.serviceImpl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cmd.vo.MemberVO;
import cmd.service.CmdService;
import helper.dao.CommonDAO;




@Service("cmdService")
public class CmdServiceImpl implements CmdService
{
	
	@Resource(name="commonDao")
	private CommonDAO commonDao;

	@Override
	public Object check_login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		MemberVO memberVo = new MemberVO();
		MemberVO memberVo2 = new MemberVO();
		
		try {
			memberVo = (MemberVO) this.commonDao.getReadData("login.login_check", map);
			
			if(memberVo == null){
				memberVo2.setCheck("no");
				memberVo = memberVo2;
			} else {				
				memberVo.setCheck("yes");
				
			}
						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberVo;
	}


}//end class

