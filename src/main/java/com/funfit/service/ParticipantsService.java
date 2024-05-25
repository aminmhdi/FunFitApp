package com.funfit.service;

import java.util.List;

import com.funfit.bean.Participants;
import com.funfit.dao.ParticipantsDao;

public class ParticipantsService {
	ParticipantsDao db = new ParticipantsDao();

	public List<Participants> list(String name, String phone, String bid) {
		return db.list(name, phone, bid);
	}

	public Participants get(int id) {
		return db.get(id);
	}

	public String create(Participants participant) {
		if (db.create(participant) > 0) {
			return "";
		} else {
			return "Participant did't add";
		}
	}

	public String update(Participants participant) {
		if (db.update(participant) > 0) {
			return "";
		} else {
			return "Participant did't update";
		}
	}

	public String delete(int id) {
		if (db.delete(id) > 0) {
			return "";
		} else {
			return "Participant did't delete";
		}
	}
}
