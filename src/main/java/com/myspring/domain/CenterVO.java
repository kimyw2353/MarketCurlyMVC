package com.myspring.domain;

import java.util.Date;

public class CenterVO {
	
	/*create table center(
		    cno number not null, --�۹�ȣ
		    ctitle varchar2(150) not null, -- ����
		    ccontent varchar2(2000) not null, -- ����
		    cwriter varchar2(50) not null, -- �ۼ���
		    cwdate date default sysdate, -- ��� ��¥
		    cviewCnt int default 0, -- ��ȸ��
		    cfilename varchar2(150) not null, --÷�����ϸ�
		    coriginFilename varchar2(150) not null, --�������ϸ�
		    cfilesize long not null, --÷������ũ��
		    cold_filename varchar2(150) not null --���� ÷�� ���ϸ�
			);
	*/
	
	private int cno;
	private String ctitle;
	private String ccontent;
	private String cwriter;
	private Date cwdate;
	private int cviewCnt;
	private String cfilename; // ÷�����ϸ�(������ ���ϸ�: ���ϸ�_xxxx.txt)
	private String coriginFilename; //�������ϸ�
	private long cfilesize; // ÷������ũ��
	private String cold_filename;//������ ÷���ߴ� ���ϸ�[���� ó����]
	
	
	public int getCno() {
		return cno;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCwriter() {
		return cwriter;
	}
	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}
	public Date getCwdate() {
		return cwdate;
	}
	public void setCwdate(Date cwdate) {
		this.cwdate = cwdate;
	}
	public int getCviewCnt() {
		return cviewCnt;
	}
	public void setCviewCnt(int cviewCnt) {
		this.cviewCnt = cviewCnt;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCfilename() {
		return cfilename;
	}
	public void setCfilename(String cfilename) {
		this.cfilename = cfilename;
	}
	public String getCoriginFilename() {
		return coriginFilename;
	}
	public void setCoriginFilename(String coriginFilename) {
		this.coriginFilename = coriginFilename;
	}
	public long getCfilesize() {
		return cfilesize;
	}
	public void setCfilesize(long cfilesize) {
		this.cfilesize = cfilesize;
	}
	public String getCold_filename() {
		return cold_filename;
	}
	public void setCold_filename(String cold_filename) {
		this.cold_filename = cold_filename;
	}
	@Override
	public String toString() {
		return "CenterVO [cno=" + cno + ", ctitle=" + ctitle + ", ccontent=" + ccontent + ", cwriter=" + cwriter
				+ ", cwdate=" + cwdate + ", cviewCnt=" + cviewCnt + ", creadnum=" + ", cfilename="
				+ cfilename + ", coriginFilename=" + coriginFilename + ", cfilesize=" + cfilesize + ", cold_filename="
				+ cold_filename + "]";
	}
	
	
	
}
