package com.ecom6.service.mem;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom6.dao.mem.MemberMapper;
import com.ecom6.vo.mem.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberMapper memberDao;
    
	@Override
	public MemberVo getMember(MemberVo mvo) {
		return memberDao.getMember(mvo);
	}

	@Override
	public int idCheck(String mem_id) {
		return memberDao.idCheck(mem_id);
	}

	@Override
	public int memberJoin(MemberVo mvo) {
		return memberDao.memberJoin(mvo);
	}

	@Override
	public int memberUpdate(MemberVo mvo) {
		return memberDao.memberUpdate(mvo);
	}

	@Override
	public Map<String, Object> getMemberList(MemberVo mvo) {
		int cnt = memberDao.getMemberTot();
		ArrayList<MemberVo> members =  memberDao.getMemberList(mvo);
		 Map<String, Object>  reSet = new HashMap<>();
		 reSet.put("memberTot", cnt);
		 reSet.put("members", members);
		return reSet;
	}

}
