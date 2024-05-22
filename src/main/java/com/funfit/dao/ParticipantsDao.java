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

	public int addParticipants(Participants participants) {
		try {
			PreparedStatement pstmt = con
					.prepareStatement("insert into participants(fname,age,phonenumber,bid) values(?,?,?,?);");
			pstmt.setString(1, participants.getFname());
			pstmt.setInt(2, participants.getAge());
			pstmt.setString(3, participants.getPhonenumber());
			pstmt.setInt(4, participants.getBid());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		} finally {
			db.closeDbConnection(con);
		}
	}

	public List<Participants> viewAllParticipants() {
		List<Participants> listOfParticipats = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from participants");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Participants p = new Participants();
				p.setPid(rs.getInt(1));
				p.setFname(rs.getString(2));
				p.setAge(rs.getInt(3));
				p.setPhonenumber(rs.getString(4));
				p.setBid(rs.getInt(5));
				listOfParticipats.add(p);
			}
		} catch (Exception e) {
			System.err.println(e);
		} finally {
			db.closeDbConnection(con);
		}
		return listOfParticipats;
	}
}
