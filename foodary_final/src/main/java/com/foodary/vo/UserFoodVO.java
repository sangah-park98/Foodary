package com.foodary.vo;

public class UserFoodVO {
	private int idx;
	private String userFoodName;
	private float userKcal;
	private float userCarbs;
	private float userProtein;
	private float userFat;
	private String userFoodDate;
	private String userFoodTime;
	
	public UserFoodVO() {	}

	public UserFoodVO(int idx, String userFoodName, float userKcal, float userCarbs, float userProtein, float userFat,
			String userFoodDate, String userFoodTime) {
		super();
		this.idx = idx;
		this.userFoodName = userFoodName;
		this.userKcal = userKcal;
		this.userCarbs = userCarbs;
		this.userProtein = userProtein;
		this.userFat = userFat;
		this.userFoodDate = userFoodDate;
		this.userFoodTime = userFoodTime;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserFoodName() {
		return userFoodName;
	}

	public void setUserFoodName(String userFoodName) {
		this.userFoodName = userFoodName;
	}

	public float getUserKcal() {
		return userKcal;
	}

	public void setUserKcal(float userKcal) {
		this.userKcal = userKcal;
	}

	public float getUserCarbs() {
		return userCarbs;
	}

	public void setUserCarbs(float userCarbs) {
		this.userCarbs = userCarbs;
	}

	public float getUserProtein() {
		return userProtein;
	}

	public void setUserProtein(float userProtein) {
		this.userProtein = userProtein;
	}

	public float getUserFat() {
		return userFat;
	}

	public void setUserFat(float userFat) {
		this.userFat = userFat;
	}

	public String getUserFoodDate() {
		return userFoodDate;
	}

	public void setUserFoodDate(String userFoodDate) {
		this.userFoodDate = userFoodDate;
	}

	public String getUserFoodTime() {
		return userFoodTime;
	}

	public void setUserFoodTime(String userFoodTime) {
		this.userFoodTime = userFoodTime;
	}

	@Override
	public String toString() {
		return "UserFoodVO [idx=" + idx + ", userFoodName=" + userFoodName + ", userKcal=" + userKcal + ", userCarbs="
				+ userCarbs + ", userProtein=" + userProtein + ", userFat=" + userFat + ", userFoodDate=" + userFoodDate
				+ ", userFoodTime=" + userFoodTime + "]";
	}

	
	
}
