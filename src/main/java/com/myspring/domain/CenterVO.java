package com.myspring.domain;

import java.util.Date;

public class CenterVO {
	
	/*create table center(
		    cno number not null, --글번호
		    ctitle varchar2(150) not null, -- 제목
		    ccontent varchar2(2000) not null, -- 내용
		    cwriter varchar2(50) not null, -- 작성자
		    cwdate date default sysdate, -- 등록 날짜
		    cviewCnt int default 0, -- 조회수
		    cfilename varchar2(150) not null, --첨부파일명
		    coriginFilename varchar2(150) not null, --원본파일명
		    cfilesize long not null, --첨부파일크기
		    cold_filename varchar2(150) not null --이전 첨부 파일명
			);
	*/
	
	private int cno;
	private String ctitle;
	private String ccontent;
	private String cwriter;
	private Date cwdate;
	private int cviewCnt;
	private String cfilename; // 첨부파일명(물리적 파일명: 파일명_xxxx.txt)
	private String coriginFilename; //원본파일명
	private long cfilesize; // 첨부파일크기
	private String cold_filename;//예전에 첨부했던 파일명[수정 처리시]
	
	
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
