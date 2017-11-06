package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.coyote.RequestInfo;

import com.iu.notice.DBConnector;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class noticeDAO {

	public int getTotalCount() throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(num), 0) from notice";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount=rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return totalCount;
	}
	
	
	public void hit(int a, int b) throws Exception{
	Connection con = DBConnector.getConnect();
		
		String sql ="update notice set hit=? where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, a+1);
		st.setInt(2, b);
		st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
	}
	
	
	
	
	public int update(noticeDTO noticeDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql ="update notice set title=?, contents=? where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
		
	}
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="delete notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int insert(noticeDTO noticeDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="insert into notice values(num2.nextval,?,?,?,sysdate,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2,noticeDTO.getWriter());
		st.setString(3, noticeDTO.getContents());
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public noticeDTO select(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		noticeDTO noticeDTO=null;
		String sql="select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			noticeDTO = new noticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_data(rs.getDate("reg_data").toString());
			noticeDTO.setHit(rs.getInt("hit"));
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return noticeDTO;
		
	}
	

	
	
	
	public ArrayList<noticeDTO> selectList(int startRow,int lastRow) throws Exception{
		ArrayList<noticeDTO> ar = new ArrayList<>();
		Connection con = DBConnector.getConnect();
		
		
		
		String sql = "select * from (select rownum R, N.* from(select * from notice order by num desc) N) where R between ? and ?";
	    PreparedStatement st = con.prepareStatement(sql);	
				st.setInt(1, startRow);
				st.setInt(2, lastRow);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			noticeDTO noticeDTO = new noticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_data(rs.getDate("reg_data").toString());
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
		}
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
	
	
	
	
	
	
}
