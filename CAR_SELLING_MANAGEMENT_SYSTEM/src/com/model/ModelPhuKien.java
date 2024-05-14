package com.model;

public class ModelPhuKien {
    
    private int maPK;
    private String tenPK;
    private int soLuong;
    private String giaBan;
    private String giaNhap;

    public ModelPhuKien(int maPK, String tenPK, int soLuong, String giaNhap, String giaBan) {
        this.maPK = maPK;
        this.tenPK = tenPK;
        this.soLuong = soLuong;
        this.giaBan = giaBan;
        this.giaNhap = giaNhap;
    }

    public int getMaPK() {
        return maPK;
    }

    public void setMaPK(int maPK) {
        this.maPK = maPK;
    }

    public String getTenPK() {
        return tenPK;
    }

    public void setTenPK(String tenPK) {
        this.tenPK = tenPK;
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

    public String getGiaNhap() {
        return giaNhap;
    }

    public void setGiaNhap(String giaNhap) {
        this.giaNhap = giaNhap;
    }
    
}
