package com.sp.trip.room;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Room {
	private int roomNum;
	private String roomName;
	private String roomReg_date;
	private String roomContent;
	private int roomPeople;
	private int roomMax_people;
	private int rcNum;
	private int roomSeasonPrice;
	private int roomWd_price;
	private int roomWe_price;
	private String mhId;
	private String[] roomOptionArr;
	private String roomOption;
	private int roomBed;
	
	private List<MultipartFile> selectFile;
	private int rPhotoNum;
	private String rPhotoName;
	
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomReg_date() {
		return roomReg_date;
	}
	public void setRoomReg_date(String roomReg_date) {
		this.roomReg_date = roomReg_date;
	}
	public String getRoomContent() {
		return roomContent;
	}
	public void setRoomContent(String roomContent) {
		this.roomContent = roomContent;
	}
	public int getRoomPeople() {
		return roomPeople;
	}
	public void setRoomPeople(int roomPeople) {
		this.roomPeople = roomPeople;
	}
	public int getRoomMax_people() {
		return roomMax_people;
	}
	public void setRoomMax_people(int roomMax_people) {
		this.roomMax_people = roomMax_people;
	}
	public int getRcNum() {
		return rcNum;
	}
	public void setRcNum(int rcNum) {
		this.rcNum = rcNum;
	}
	public int getRoomSeasonPrice() {
		return roomSeasonPrice;
	}
	public void setRoomSeasonPrice(int roomSeasonPrice) {
		this.roomSeasonPrice = roomSeasonPrice;
	}
	public int getRoomWd_price() {
		return roomWd_price;
	}
	public void setRoomWd_price(int roomWd_price) {
		this.roomWd_price = roomWd_price;
	}
	public int getRoomWe_price() {
		return roomWe_price;
	}
	public void setRoomWe_price(int roomWe_price) {
		this.roomWe_price = roomWe_price;
	}
	public String getMhId() {
		return mhId;
	}
	public void setMhId(String mhId) {
		this.mhId = mhId;
	}
	public String[] getRoomOptionArr() {
		return roomOptionArr;
	}
	public void setRoomOptionArr(String[] roomOptionArr) {
		this.roomOptionArr = roomOptionArr;
	}
	public String getRoomOption() {
		return roomOption;
	}
	public void setRoomOption(String roomOption) {
		this.roomOption = roomOption;
	}
	public int getRoomBed() {
		return roomBed;
	}
	public void setRoomBed(int roomBed) {
		this.roomBed = roomBed;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public int getrPhotoNum() {
		return rPhotoNum;
	}
	public void setrPhotoNum(int rPhotoNum) {
		this.rPhotoNum = rPhotoNum;
	}
	public String getrPhotoName() {
		return rPhotoName;
	}
	public void setrPhotoName(String rPhotoName) {
		this.rPhotoName = rPhotoName;
	}
}
