package com.model;

import javax.swing.Icon;

public class ModelCar {

    public ModelCar(String tenXe, int soLuong, String Gia, Icon xeImg) {
        this.tenXe = tenXe;
        this.soLuong = soLuong;
        this.giaBan = Gia;
        this.xeImg = xeImg;
    }
    
    public ModelCar(int maXe, String tenXe, String loaiXe, String giaNhap, String giaBan, int tgbh, int soLuong, int maNCC){
        this.maXe = maXe;
        this.loaiXe = loaiXe;
        this.tenXe = tenXe;
        this.giaNhap = giaNhap;
        this.giaBan = giaBan;
        this.thoiGianBH = tgbh;
        this.soLuong = soLuong;
        this.NCC = maNCC;
    }
    

    public String getLoaiXe() {
        return loaiXe;
    }

    public void setLoaiXe(String loaiXe) {
        this.loaiXe = loaiXe;
    }

    public String getTenXe() {
        return tenXe;
    }

    public void setTenXe(String tenXe) {
        this.tenXe = tenXe;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(String giaBan) {
        this.giaBan = giaBan;
    }

    public Icon getXeImg() {
        return xeImg;
    }

    public void setXeImg(Icon xeImg) {
        this.xeImg = xeImg;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGiaNhap() {
        return giaNhap;
    }

    public void setGiaNhap(String giaNhap) {
        this.giaNhap = giaNhap;
    }

    public int getThoiGianBH() {
        return thoiGianBH;
    }

    public void setThoiGianBH(int thoiGianBH) {
        this.thoiGianBH = thoiGianBH;
    }

    public int getNCC() {
        return NCC;
    }

    public void setNCC(int NCC) {
        this.NCC = NCC;
    }

    public int getMaXe() {
        return maXe;
    }

    public void setMaXe(java.lang.Integer maXe) {
        this.maXe = maXe;
    }

    
    private String tenXe;
    private int soLuong;
    private String giaBan;
    private String description;
    private String giaNhap;
    private int thoiGianBH;
    private int NCC;
    private Icon xeImg;
    private int maXe;
    private String loaiXe;
    
}
