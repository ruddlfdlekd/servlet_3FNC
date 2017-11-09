package com.iu.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.iu.util.DBConnector;


public class QnaDAO {

	public ArrayList<QnacDTO> comments(int num)throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select * from comments where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		ArrayList<QnacDTO> ar = new ArrayList<>();
		
		while(rs.next()) {
		QnacDTO QnacDTO = new QnacDTO();
		QnacDTO.setContents(rs.getString("contents"));
		QnacDTO.setNum(rs.getInt("num"));
		QnacDTO.setWriterc(rs.getString("writerc"));
		ar.add(QnacDTO);
		}
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
	
	
	
	
	
	
	
	
	public int getTotalCount(String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(num), 0) from qna where "+ kind+ " like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return totalCount;
	}

	public void hit(int a, int b) throws Exception {
		Connection con = DBConnector.getConnect();

		String sql = "update qna set hit=? where num=?";

		PreparedStatement st = con.prepareStatement(sql);

		st.setInt(1, a + 1);
		st.setInt(2, b);
		st.executeUpdate();

		DBConnector.disConnect(st, con);

	}

	public int update(QnaDTO QnaDTO) throws Exception {
		Connection con = DBConnector.getConnect();

		String sql = "update qna set title=?, contents=? where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, QnaDTO.getTitle());
		st.setString(2, QnaDTO.getContents());
		st.setInt(3, QnaDTO.getNum());

		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;

	}

	public int delete(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete qna where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	public int insert(QnaDTO QnaDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into qna values(qna_seq.nextval,?,?,?,0,sysdate)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, QnaDTO.getTitle());
		st.setString(2, QnaDTO.getContents());
		st.setString(3, QnaDTO.getWriter());
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);
		return result;
	}

	public QnaDTO select(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		QnaDTO noticeDTO = null;
		String sql = "select * from qna where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		if (rs.next()) {
			noticeDTO = new QnaDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date").toString());
			noticeDTO.setHit(rs.getInt("hit"));
		}

		DBConnector.disConnect(rs, st, con);

		return noticeDTO;

	}

	public ArrayList<QnaDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception {
		ArrayList<QnaDTO> ar = new ArrayList<>();
		Connection con = DBConnector.getConnect();

		String sql ="select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from qna where "+kind+" like ? order by num desc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%" + search + "%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);

		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			QnaDTO QnaDTO = new QnaDTO();
			QnaDTO.setNum(rs.getInt("num"));
			QnaDTO.setTitle(rs.getString("title"));
			QnaDTO.setWriter(rs.getString("writer"));
			QnaDTO.setContents(rs.getString("contents"));
			QnaDTO.setReg_date(rs.getDate("reg_date").toString());
			QnaDTO.setHit(rs.getInt("hit"));
			ar.add(QnaDTO);
		}
		DBConnector.disConnect(rs, st, con);

		return ar;
	}

}
