package com.example.demo.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Artist {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String fullName;
	private String artistType;
	private int age;
	private String gender;
	private String experience;
	private String phoneNo;
	private String height;
	private String weight;
	private String location;
	private String languages;
	private String email;
	public String getPermiumMember() {
		return permiumMember;
	}
	public void setPermiumMember(String permiumMember) {
		this.permiumMember = permiumMember;
	}
	private String biography;
	private String profilePhoto;
	private String morePhoto;
	private String permiumMember;
	
	private String instaLink;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	private String fbLink;
	private String ytLink;
	private String address;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getArtistType() {
		return artistType;
	}
	public void setArtistType(String artistType) {
		this.artistType = artistType;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBiography() {
		return biography;
	}
	public void setBiography(String biography) {
		this.biography = biography;
	}
	public String getProfilePhoto() {
		return profilePhoto;
	}
	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}
	
	
	public String getMorePhoto() {
		return morePhoto;
	}
	public void setMorePhoto(String morePhoto) {
		this.morePhoto = morePhoto;
	}
	public String getInstaLink() {
		return instaLink;
	}
	public void setInstaLink(String instaLink) {
		this.instaLink = instaLink;
	}
	public String getFbLink() {
		return fbLink;
	}
	public void setFbLink(String fbLink) {
		this.fbLink = fbLink;
	}
	public String getYtLink() {
		return ytLink;
	}
	public void setYtLink(String ytLink) {
		this.ytLink = ytLink;
	}
	
	
	
	
}
