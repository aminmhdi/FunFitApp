package com.funfit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.funfit.bean.Batch;
import com.funfit.resource.DbResource;

public class BatchDao {

	DbResource db;
	Connection con;

	public BatchDao() {
		db = new DbResource();
		con = db.getDbConnection();
	}

	public List<Batch> list() {
		List<Batch> listOfBatch = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from batch");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Batch b = new Batch();
				b.setBid(rs.getInt(1));
				b.setTypeofbatch(rs.getString(2));
				b.setTime(rs.getString(3));
				listOfBatch.add(b);
			}
		} catch (Exception e) {
			System.err.println(e);
		} finally {
			db.closeDbConnection(con);
		}
		return listOfBatch;
	}

	public Batch get(int id) {
		Batch model = null;
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from batch where bid = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.first()) {
				model = new Batch();
				model.setBid(rs.getInt(1));
				model.setTypeofbatch(rs.getString(2));
				model.setTime(rs.getString(3));
			}
		} catch (Exception e) {
			System.err.println(e);
		} finally {
			db.closeDbConnection(con);
		}
		return model;
	}

	public int create(Batch batch) {
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into batch(typeofbatch,time) values(?,?)");
			pstmt.setString(1, batch.getTypeofbatch());
			pstmt.setString(2, batch.getTime());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.err.println(e);
			return 0;
		} finally {
			db.closeDbConnection(con);
		}
	}

	public int update(Batch batch) {
		try {
			PreparedStatement pstmt = con.prepareStatement("update batch set typeofbatch = ?, time = ? where bid = ?");
			pstmt.setString(1, batch.getTypeofbatch());
			pstmt.setString(2, batch.getTime());
			pstmt.setInt(3, batch.getBid());
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
			PreparedStatement pstmt = con.prepareStatement("delete from batch where bid = ?");
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
