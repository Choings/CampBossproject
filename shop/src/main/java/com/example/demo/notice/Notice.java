package com.example.demo.notice;

import java.sql.Date;

public class Notice {

    private int notice_num;
    private String notice_name;
    private String notice_info;
    private String notice_id;
    private Date notice_date;
	public Notice() {
		super();
	}
	public Notice(int notice_num, String notice_name, String notice_info, String notice_id, Date notice_date) {
		super();
		this.notice_num = notice_num;
		this.notice_name = notice_name;
		this.notice_info = notice_info;
		this.notice_id = notice_id;
		this.notice_date = notice_date;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}
	public String getNotice_info() {
		return notice_info;
	}
	public void setNotice_info(String notice_info) {
		this.notice_info = notice_info;
	}
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	@Override
	public String toString() {
		return "Notice [notice_num=" + notice_num + ", notice_name=" + notice_name + ", notice_info=" + notice_info
				+ ", notice_id=" + notice_id + ", notice_date=" + notice_date + "]";
	}

    
}