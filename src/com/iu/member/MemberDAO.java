package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.iu.util.DBConnector;


public class MemberDAO {
	//getCount
	public int Delete(String id)throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "Delete from member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
		
	}
	
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception{
		MemberDTO mDto = null;
		Connection con = DBConnector.getConnect();
		String sql = "select * from member where id=? and pw=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		ResultSet rs = st.executeQuery();
		
		
		if(rs.next()) {
			mDto = new MemberDTO();
			mDto.setId(rs.getString("id"));
			mDto.setName(rs.getString("name"));
			mDto.setEmail(rs.getString("email"));
			mDto.setPhone(rs.getString("phone"));
			mDto.setAge(rs.getInt("age"));
			mDto.setJob(rs.getString("job"));
		}
	
		DBConnector.disConnect(rs, st, con);
		
		
		return mDto;
	
	}
	
	
	
	
	
	
	
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
	
	
	
	
	public int insert(MemberDTO MemberDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into member values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, MemberDTO.getId());
		st.setString(2, MemberDTO.getPw());
		st.setString(3, MemberDTO.getName());
		st.setString(4, MemberDTO.getEmail());
		st.setString(5, MemberDTO.getPhone());
		st.setInt(6, MemberDTO.getAge());
		st.setString(7, MemberDTO.getJob());
		
		
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);
		return result;
	}
	
	
	public String idcheck(String id) throws Exception {
		
		Connection con = DBConnector.getConnect();
		String sql = "select id from member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		String s = "아이디 생성 가능";
		if(rs.next()) 
				s="아이디 중복";
		
			
		DBConnector.disConnect(rs, st, con);
		
		return s;
		
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
