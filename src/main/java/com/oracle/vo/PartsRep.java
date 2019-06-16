package com.oracle.vo;

public class PartsRep {
	Integer partsid=0;
	String partsname=null;
	Integer partsreqcount=0;
	public Integer getPartsid() {
		return partsid;
	}
	public void setPartsid(Integer partsid) {
		this.partsid = partsid;
	}
	public String getPartsname() {
		return partsname;
	}
	public void setPartsname(String partsname) {
		this.partsname = partsname;
	}
	public Integer getPartsreqcount() {
		return partsreqcount;
	}
	public void setPartsreqcount(Integer partsreqcount) {
		this.partsreqcount = partsreqcount;
	}
	@Override
	public String toString() {
		return "PartsRep [partsid=" + partsid + ", partsname=" + partsname + ", partsreqcount=" + partsreqcount + "]";
	}
	
	
}
