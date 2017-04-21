package cmd.serviceImpl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cmd.vo.MemberVO;
import cmd.vo.StampVO;
import cmd.service.CmdService;
import helper.dao.CommonDAO;

@Service("cmdService")
public class CmdServiceImpl implements CmdService {

	@Resource(name = "commonDao")
	private CommonDAO commonDao;

	@Override
	public Object check_login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		MemberVO memberVo = new MemberVO();
		MemberVO memberVo2 = new MemberVO();

		try {
			memberVo = (MemberVO) this.commonDao.getReadData("login.login_check", map);

			if (memberVo == null) {
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

	@Override
	public void memberJoin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.insertData("cmd.userJoin", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public StampVO stampInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		StampVO stampInfo = null;

		try {
			stampInfo = (StampVO) this.commonDao.getReadData("cmd.selectStampInfo", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return stampInfo;
	}

	@Override
	public void saveStamp(Map<String, Object> map) {
		// TODO Auto-generated method stub
		StampVO stampInfo = null;
		
		try {
			stampInfo = (StampVO) this.commonDao.getReadData("cmd.selectStampInfo", map);
			
			if(stampInfo == null){
				this.commonDao.insertData("cmd.insertStamp", map);
			} else {
				this.commonDao.updateData("cmd.updateStamp", map);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}// end class
