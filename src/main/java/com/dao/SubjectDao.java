package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbcon.DBConnect;
import com.pojo.Instructions;
import com.pojo.Subject;

public class SubjectDao {
	
	Connection con = DBConnect.getConnection();
	
	public boolean addSubject(Subject s) {
		String sql =  "insert into subjects(subject_name) values(?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, s.getSubject_name());
			int i = ps.executeUpdate();
			if(i>0) {
				return true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	
		return false;
	}
	
	
	public List<Subject> getAllSubject(){
		String sql = "select * from subjects";
		List<Subject> slist = new ArrayList<Subject>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Subject s = new Subject();
				s.setId(rs.getInt("id"));
				s.setSubject_name(rs.getString("subject_name"));
				
				slist.add(s);
			}
			return slist;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public boolean deleteSubject(int id) {
		String sql = "delete from subjects where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			if(i>0) {
				return true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
	public boolean updateSubject(Subject s) {
		String sql = "update subjects set subject_name=? where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, s.getSubject_name());
			ps.setInt(2, s.getId());
			
			int check = ps.executeUpdate();
			if(check>0) {
				return true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	public Subject getSubjectById(int id) {
		String sql = "select * from subjects where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			Subject s = new Subject();
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				s.setId(rs.getInt(1));
				s.setSubject_name(rs.getString(2));
				
			}
			return s;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	

}
