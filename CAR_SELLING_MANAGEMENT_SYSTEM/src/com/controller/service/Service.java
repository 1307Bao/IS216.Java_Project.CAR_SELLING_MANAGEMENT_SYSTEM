package com.controller.service;

import Connection.DatabaseConnection;
import com.model.ModelCar;
import com.model.ModelPhuKien;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Service {
    
    private final Connection con;

    //Connect tới DataBase       
    public Service() {
        con = DatabaseConnection.getInstance().getConnection();
    }
    
    //Lay toan bo xe
    public ArrayList<ModelCar> listCar() throws SQLException{
        ArrayList<ModelCar> list = new ArrayList<ModelCar>();
        String sql = "SELECT MaXe, TenXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh, SoLuong, MaNCC FROM Xe";
        PreparedStatement p = con.prepareStatement(sql);
        ResultSet r = p.executeQuery();
        while (r.next()){
            int maXe = r.getInt(1);
            String tenXe = r.getString(2);
            String loaiXe = r.getString(3);
            String giaNhap = String.valueOf(r.getLong(4));
            String giaBan = String.valueOf(r.getLong(5));
            int tgbh = r.getInt(6);
            int soLuong = r.getInt(7);
            int maNCC = r.getInt(8);
            
            ModelCar data = new ModelCar(maXe, tenXe, loaiXe, giaNhap, giaBan, tgbh, soLuong, maNCC);
            list.add(data);
        }
        p.close();
        r.close();
        return list;
    } 
    
    //Tim xe tu ten xe
    public ModelCar getCar(String name) throws SQLException{
        ModelCar data = null;
        String sql = "SELECT MaXe, TenXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh, SoLuong, MaNCC FROM Xe"
                + "WHERE TenXe = ?";
        PreparedStatement p = con.prepareStatement(sql);
        p.setString(2, name);
        ResultSet r = p.executeQuery();
        while (r.next()){
            int maXe = r.getInt(1);
            String tenXe = r.getString(2);
            String loaiXe = r.getString(3);
            String giaNhap = String.valueOf(r.getLong(4));
            String giaBan = String.valueOf(r.getLong(5));
            int tgbh = r.getInt(6);
            int soLuong = r.getInt(7);
            int maNCC = r.getInt(8);
            
           data = new ModelCar(maXe, tenXe, loaiXe, giaNhap, giaBan, tgbh, soLuong, maNCC);
        }
        p.close();
        r.close();
        return data;
    }
    
    //Lay tat ca xe tu loai xe
    public ArrayList<ModelCar> listLoaiXe(String loaiXe) throws SQLException{
        ArrayList<ModelCar> list = new ArrayList<ModelCar>();
        String sql = "SELECT * FROM Xe WHERE LoaiXe = ?";
        PreparedStatement p = con.prepareStatement(sql);
        p.setString(3, loaiXe);
        ResultSet r = p.executeQuery();
        while (r.next()){
            int maXe = r.getInt(1);
            String tenXe = r.getString(2);
            String giaNhap = String.valueOf(r.getLong(4));
            String giaBan = String.valueOf(r.getLong(5));
            int tgbh = r.getInt(6);
            int soLuong = r.getInt(7);
            int maNCC = r.getInt(8);
            
            ModelCar data = new ModelCar(maXe, tenXe, loaiXe, giaNhap, giaBan, tgbh, soLuong, maNCC);
            list.add(data);
        }
        p.close();
        r.close();
        return list;
    }
    
    //Lay MaXe tiep theo duoc them
    public int getNextID() throws SQLException{
        int id = 0;
        String sql = "SELECT MIN(MaXe) + 1 FROM XE WHERE MaXe + 1 NOT IN (SELECT MaXe FROM XE)";
        PreparedStatement p = con.prepareStatement(sql);
        ResultSet r = p.executeQuery();
        while (r.next()){
            id = r.getInt(1);
        }
        p.close();
        r.close();
        return id;
    }
    
    //Them 1 xe moi vao db
    public void insertCar(ModelCar model) throws SQLException{
        String sql = "Insert into Xe(maXe, tenXe, loaiXe, giaNhap, giaBan, tgbh, soLuong, maNCC) VALUES"
                + "{?, ?, ?, ?, ?, ?, ?, ?}";
        PreparedStatement p = con.prepareStatement(sql);
        p.setInt(1, model.getMaXe());
        p.setString(2, model.getTenXe());
        p.setString(3, model.getLoaiXe());
        p.setInt(4, Integer.parseInt(model.getGiaNhap()));
        p.setInt(4, Integer.parseInt(model.getGiaBan()));
        p.setInt(6, model.getThoiGianBH());
        p.setInt(7, model.getSoLuong());
        p.setInt(8, model.getNCC());
        p.execute();
        p.close();
    }
    
    //Cap nhat thong tin xe
    public void UpdateCar(ModelCar model) throws SQLException{
        String sql = "UPDATE XE SET tenXe = ?, loaiXe = ?, giaNhap = ?, giaBan = ?, tgbh = ?, soLuong = ?, maNCC = ?"
                + "WHERE maXe = ?;";
        PreparedStatement p = con.prepareStatement(sql);
        p.setString(2, model.getTenXe());
        p.setString(3, model.getLoaiXe());
        p.setInt(4, Integer.parseInt(model.getGiaNhap()));
        p.setInt(5, Integer.parseInt(model.getGiaBan()));
        p.setInt(6, model.getThoiGianBH());
        p.setInt(7, model.getSoLuong());
        p.setInt(8, model.getNCC());
        p.setInt(1, model.getMaXe());
        p.execute();
        p.close();  
    }
    
    //Lay tat ca phu kien
    public ArrayList<ModelPhuKien> listPhuKien() throws SQLException{
        ArrayList<ModelPhuKien> list = new ArrayList<ModelPhuKien>();
        String sql = "SELECT MaPK, TenPK, SoLuong, GiaNhap, GiaBan FROM PHUKIEN";
        PreparedStatement p = con.prepareStatement(sql);
        ResultSet r = p.executeQuery();
        while (r.next()){
            int maPK = r.getInt(1);
            String tenPK = r.getString(2);
            int soLuong = r.getInt(3);
            String giaNhap = r.getString(4);
            String giaBan = r.getString(5);
            ModelPhuKien data = new ModelPhuKien(maPK, tenPK, soLuong, giaNhap, giaBan);
            list.add(data);
        }
        p.close();
        r.close();
        return list;
    }
    
    //Tim phu kien theo ten phu kien
    public ModelPhuKien getPhuKien(String tenPK) throws SQLException{
        ModelPhuKien data = null;
        String sql = "SELECT * FROM PHUKIEN WHERE TenPK = ?";
        PreparedStatement p = con.prepareStatement(sql);
        p.setString(2, tenPK);
        ResultSet r = p.executeQuery();
        while (r.next()){
            int maPK = r.getInt(1);
            int soLuong = r.getInt(3);
            String giaNhap = r.getString(4);
            String giaBan = r.getString(5);
            
            data = new ModelPhuKien(maPK, tenPK, soLuong, giaNhap, giaBan);
        }
        
        p.close();
        r.close();
        return data;
    }
    
    //Cap nhat phu kien
    public void UpdatePK(ModelPhuKien model) throws SQLException{
        String sql = "UPDATE PHUKIEN SET tenPK = ?, soLuong = ?, giaNhap = ?, giaBan = ?"
                + "WHERE maPK = ?";
        PreparedStatement p = con.prepareStatement(sql);
        p.setString(2, model.getTenPK());
        p.setInt(3, model.getSoLuong());
        p.setInt(4, Integer.parseInt(model.getGiaNhap()));
        p.setInt(4, Integer.parseInt(model.getGiaBan()));
        p.setInt(1, model.getMaPK());
        p.execute();
        p.close();
    }
}
