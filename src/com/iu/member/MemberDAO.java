package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class MemberDAO {
	//getCount
	public int getTotalCount(String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(id), 0) from member where "+ kind+ " like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		
		return result;
	}
	
	
	//selectList
	public ArrayList<MemberDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception{
		
		Connection con = DBConnector.getConnect();
		
		String sql ="select * from "
				+ "(select rownum R, M.* from "
				+ "(select * from member where "+kind+" like ? order by id asc) M) "
				+ "where R between ? and ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%" + search + "%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		
		ResultSet rs = st.executeQuery();
		ArrayList<MemberDTO> ar = new ArrayList<>();
		
		while(rs.next()) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(rs.getString("id"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setPhone(rs.getString("phone"));
			memberDTO.setAge(rs.getInt("age"));
			memberDTO.setJob(rs.getString("job"));
			ar.add(memberDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
	//======================
	
	

}
