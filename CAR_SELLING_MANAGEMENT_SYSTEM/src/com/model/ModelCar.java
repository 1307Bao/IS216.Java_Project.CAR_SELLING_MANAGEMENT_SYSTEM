package com.model;

import javax.swing.Icon;

public class ModelCar {

    public ModelCar(String tenXe, String trangThai, String Gia, Icon xeImg) {
        this.tenXe = tenXe;
        this.trangThai = trangThai;
        this.Gia = Gia;
        this.xeImg = xeImg;
    }

    public String getTenXe() {
        return tenXe;
    }

    public void setTenXe(String tenXe) {
        this.tenXe = tenXe;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getGia() {
        return Gia;
    }

    public void setGia(String Gia) {
        this.Gia = Gia;
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

    
    private String tenXe;
    private String trangThai;
    private String Gia;
    private String description;
    private Icon xeImg;
}
