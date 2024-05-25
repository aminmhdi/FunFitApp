package com.funfit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.funfit.bean.Participants;
import com.funfit.resource.DbResource;

public class ParticipantsDao {

	DbResource db;
	Connection con;

	public ParticipantsDao() {
		db = new DbResource();
		con = db.getDbConnection();
	}

	public List<Participants> list(String name, String phone, String bid) {
		List<Participants> listOfParticipants = new ArrayList<>();
		try {			
			PreparedStatement pstmt = con.prepareStatement(generateListQuery(name, phone, bid));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Participants p = new Participants();
				p.setPid(rs.getInt(1));
				p.setFname(rs.getString(2));
				p.setLname(rs.getString(3));
				p.setAge(rs.getInt(4));
				p.setPhonenumber(rs.getString(5));
				p.setBid(rs.getInt(6));
				p.setBname(rs.getString(7));
				listOfParticipants.add(p);
			}
		} catch (Exception e) {
			System.err.println(e);
		} finally {
			db.closeDbConnection(con);
		}
		return listOfParticipants;
	}
	
	private static String generateListQuery(String name, String phone, String bid)
	{
		StringBuilder query = new StringBuilder("select p.*, "
				+ "CONCAT(b.time, ' (',b.typeofbatch, ')') as bname "
				+ "from participants p "
				+ "inner join batch b "
				+ "on p.bid = b.bid "
				+ "where 1=1 ");
		if(name != null && !name.isEmpty())
			query.append("AND lower(CONCAT(p.fname, ' ', p.lname)) like '%" + name.toLowerCase() + "%'");
		if(phone != null && !phone.isEmpty())
			query.append("AND lower(p.phonenumber) like '%" + phone.toLowerCase() + "%'");
		if(bid != null && !bid.isEmpty())
			query.append("AND p.bid = " + bid);
		
		return query.toString();
	}

	public Participants get(int id) {
		Participants model = null;
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from participants where pid = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.first()) {
				model = new Participants();
				model.setPid(rs.getInt(1));
				model.setFname(rs.getString(2));
				model.setLname(rs.getString(3));
				model.setAge(rs.getInt(4));
				model.setPhonenumber(rs.getString(5));
				model.setBid(rs.getInt(6));
			}
		} catch (Exception e) {
			System.err.println(e);
		} finally {
			db.closeDbConnection(con);
		}
		return model;
	}

	public int create(Participants participants) {
		try {
			PreparedStatement pstmt = con
					.prepareStatement("insert into participants(fname,lname,age,phonenumber,bid) values(?,?,?,?,?);");
			pstmt.setString(1, participants.getFname());
			pstmt.setString(2, participants.getLname());
			pstmt.setInt(3, participants.getAge());
			pstmt.setString(4, participants.getPhonenumber());
			pstmt.setInt(5, participants.getBid());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		} finally {
			db.closeDbConnection(con);
		}
	}

	public int update(Participants participant) {
		try {
			PreparedStatement pstmt = con.prepareStatement("update participants set "
					+ "fname = ?, "
					+ "lname = ?, "
					+ "age = ?, "
					+ "phonenumber = ?, "
					+ "bid = ? "
					+ "where "
					+ "pid = ?");
			pstmt.setString(1, participant.getFname());
			pstmt.setString(2, participant.getLname());
			pstmt.setInt(3, participant.getAge());
			pstmt.setString(4, participant.getPhonenumber());
			pstmt.setInt(5, participant.getBid());
			pstmt.setInt(6, participant.getPid());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		} finally {
			db.closeDbConnection(con);
		}
	}

	public int delete(int id) {
		try {
			PreparedStatement pstmt = con.prepareStatement("delete from participants where pid = ?");
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		} finally {
			db.closeDbConnection(con);
		}
	}
}
