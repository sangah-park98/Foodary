package com.foodary.vo;

public class DietVO {
   
   private int idx;
   private String dietMemo;
   private String dietPicture;
   private String dietWriteDate;
   private String dietWriteTime;
   
   public DietVO() { }

	public DietVO(int idx, String dietMemo, String dietPicture, String dietWriteDate, String dietWriteTime) {
		this.idx = idx;
		this.dietMemo = dietMemo;
		this.dietPicture = dietPicture;
		this.dietWriteDate = dietWriteDate;
		this.dietWriteTime = dietWriteTime;
	}
	
	public int getIdx() {
		return idx;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getDietMemo() {
		return dietMemo;
	}
	
	public void setDietMemo(String dietMemo) {
		this.dietMemo = dietMemo;
	}
	
	public String getDietPicture() {
		return dietPicture;
	}
	
	public void setDietPicture(String dietPicture) {
		this.dietPicture = dietPicture;
	}
	
	public String getDietWriteDate() {
		return dietWriteDate;
	}
	
	public void setDietWriteDate(String dietWriteDate) {
		this.dietWriteDate = dietWriteDate;
	}
	
	public String getDietWriteTime() {
		return dietWriteTime;
	}
	
	public void setDietWriteTime(String dietWriteTime) {
		this.dietWriteTime = dietWriteTime;
	}
	
	@Override
	public String toString() {
		return "DietVO [idx=" + idx + ", dietMemo=" + dietMemo + ", dietPicture=" + dietPicture + ", dietWriteDate="
				+ dietWriteDate + ", dietWriteTime=" + dietWriteTime + "]";
	}
	   
   

}