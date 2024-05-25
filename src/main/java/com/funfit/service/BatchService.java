package com.funfit.service;

import java.util.List;

import com.funfit.bean.Batch;
import com.funfit.dao.BatchDao;

public class BatchService {

	BatchDao db;

	public BatchService() {
		db = new BatchDao();
	}

	public List<Batch> list() {
		return db.list();
	}

	public Batch get(int id) {
		return db.get(id);
	}

	public String create(Batch batch) {
		if (db.create(batch) > 0) {
			return "";
		} else {
			return "Batch did't add";
		}
	}

	public String update(Batch batch) {
		if (db.update(batch) > 0) {
			return "";
		} else {
			return "Batch did't update";
		}
	}

	public String delete(int id) {
		if (db.delete(id) > 0) {
			return "";
		} else {
			return "Batch did't delete";
		}
	}
}
