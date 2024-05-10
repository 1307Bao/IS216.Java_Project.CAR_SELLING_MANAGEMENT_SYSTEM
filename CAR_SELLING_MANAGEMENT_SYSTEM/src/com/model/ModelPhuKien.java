package com.model;

public class ModelPhuKien {
    
    private String maPK;
    private String ngayNhap;
    private String tenPK;
    private String xuatSu;
    private int soLuong;
    private String donGia;

    public ModelPhuKien(String maPK, String ngayNhap, String tenPK, String xuatSu, int soLuong, String donGia) {
        this.maPK = maPK;
        this.ngayNhap = ngayNhap;
        this.tenPK = tenPK;
        this.xuatSu = xuatSu;
        this.soLuong = soLuong;
        this.donGia = donGia;
    }

    public String getMaPK() {
        return maPK;
    }

    public void setMaPK(String maPK) {
        this.maPK = maPK;
    }

    public String getNgayNhap() {
        return ngayNhap;
    }

    public void setNgayNhap(String ngayNhap) {
        this.ngayNhap = ngayNhap;
    }

    public String getTenPK() {
        return tenPK;
    }

    public void setTenPK(String tenPK) {
        this.tenPK = tenPK;
    }

    public String getXuatSu() {
        return xuatSu;
    }

    public void setXuatSu(String xuatSu) {
        this.xuatSu = xuatSu;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getDonGia() {
        return donGia;
    }

    public void setDonGia(String donGia) {
        this.donGia = donGia;
    }
    
    
}
