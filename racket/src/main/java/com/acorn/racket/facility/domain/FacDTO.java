package com.acorn.racket.facility.domain;

import org.json.JSONObject;

import lombok.Data;

public class FacDTO {
	private String facilityID;
	private String minclassname;
	private String service_status;
	private String facName;
	private String payment;
	private String place;
	private String service_target;
	private String url;
	private String location_x;
	private String location_y;
	private String service_start_day;
	private String service_end_day;
	private String reception_start_date;
	private String reception_end_date;
	private String region_name;
	private String image;
	private String details;
	private String tel_num;
	private String service_start_time;
	private String service_end_time;
	private int count;
	private String liked;
	private String rating;
	
	
	
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getLiked() {
		return liked;
	}
	public void setLiked(String liked) {
		this.liked = liked;
	}

	public String getFacilityID() {
		return facilityID;
	}
	public void setFacilityID(String facillityID) {
		this.facilityID = facillityID;
	}
	public String getMinclassname() {
		return minclassname;
	}
	public void setMinclassname(String minclassname) {
		this.minclassname = minclassname;
	}
	public String getService_status() {
		return service_status;
	}
	public void setService_status(String service_status) {
		this.service_status = service_status;
	}
	public String getFacName() {
		return facName;
	}
	public void setFacName(String facName) {
		this.facName = facName;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getService_target() {
		return service_target;
	}
	public void setService_target(String service_target) {
		this.service_target = service_target;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLocation_x() {
		return location_x;
	}
	public void setLocation_x(String location_x) {
		this.location_x = location_x;
	}
	public String getLocation_y() {
		return location_y;
	}
	public void setLocation_y(String location_y) {
		this.location_y = location_y;
	}
	public String getService_start_day() {
		return service_start_day;
	}
	public void setService_start_day(String service_start_day) {
		this.service_start_day = service_start_day;
	}
	public String getService_end_day() {
		return service_end_day;
	}
	public void setService_end_day(String service_end_day) {
		this.service_end_day = service_end_day;
	}
	public String getReception_start_date() {
		return reception_start_date;
	}
	public void setReception_start_date(String reception_start_date) {
		this.reception_start_date = reception_start_date;
	}
	public String getReception_end_date() {
		return reception_end_date;
	}
	public void setReception_end_date(String reception_end_date) {
		this.reception_end_date = reception_end_date;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getTel_num() {
		return tel_num;
	}
	public void setTel_num(String tel_num) {
		this.tel_num = tel_num;
	}
	public String getService_start_time() {
		return service_start_time;
	}
	public void setService_start_time(String service_start_time) {
		this.service_start_time = service_start_time;
	}
	public String getService_end_time() {
		return service_end_time;
	}
	public void setService_end_time(String service_end_time) {
		this.service_end_time = service_end_time;
	}

	public FacDTO() {
		// TODO Auto-generated constructor stub
	}
	public FacDTO(JSONObject itemJson) {
		this.facilityID = itemJson.getString("SVCID");
		this.minclassname = itemJson.getString("MINCLASSNM");
		this.service_status = itemJson.getString("SVCSTATNM");
		this.facName =  itemJson.getString("SVCNM");
		this.payment = itemJson.getString("PAYATNM");
		this.place =  itemJson.getString("PLACENM");
		this.service_target =  itemJson.getString("USETGTINFO");
		this.url =  itemJson.getString("SVCURL");
		this.location_x =  itemJson.getString("X");
		this.location_y =  itemJson.getString("Y");
		this.service_start_day =  itemJson.getString("SVCOPNBGNDT");
		this.service_end_day =  itemJson.getString("SVCOPNENDDT");
		this.reception_start_date = itemJson.getString("RCPTBGNDT");
		this.reception_end_date = itemJson.getString("RCPTENDDT");
		this.region_name =  itemJson.getString("AREANM");
		this.image =  itemJson.getString("IMGURL");
		this.details =  itemJson.getString("DTLCONT");
		this.tel_num =  itemJson.getString("TELNO");
		this.service_start_time = itemJson.getString("V_MIN");
		this.service_end_time =  itemJson.getString("V_MAX");
	}
	@Override
	public String toString() {
		return "FacDTO [facillityID=" + facilityID + ", minclassname=" + minclassname + ", service_status="
				+ service_status + ", facName=" + facName + ", payment=" + payment + ", place=" + place
				+ ", service_target=" + service_target + ", url=" + url + ", location_x=" + location_x + ", location_y="
				+ location_y + ", service_start_day=" + service_start_day + ", service_end_day=" + service_end_day
				+ ", reception_start_date=" + reception_start_date + ", reception_end_date=" + reception_end_date
				+ ", region_name=" + region_name + ", image=" + image + ", details=" + details + ", tel_num=" + tel_num
				+ ", service_start_time=" + service_start_time + ", service_end_time=" + service_end_time + "]";
	}
	
}
