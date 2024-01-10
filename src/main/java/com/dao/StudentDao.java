package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbcon.DBConnect;
import com.mysql.cj.xdevapi.PreparableStatement;
import com.mysql.cj.xdevapi.Result;
import com.pojo.Student;

public class StudentDao {

	Connection con = DBConnect.getConnection();
	
	public boolean addStudent(Student s) {
		
		String sql = "insert into student(name, contact, email, username, password, image) values(?,?,?,?,?,?)";
		
		try {
			 PreparedStatement ps = con.prepareStatement(sql);
			 ps.setString(1, s.getName());
			 ps.setString(2, s.getContact());
			 ps.setString(3, s.getEmail());
			 ps.setString(4, s.getUsername());
			 ps.setString(5, s.getPassword());
			 ps.setString(6, s.getImage());
			 
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
	
	
	
	public Student loginStudent(String email, String password){
		
		String sql = "select * from student where email=? and password=?";
		Student s = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);			
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				s = new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setContact(rs.getString("contact"));
				s.setEmail(rs.getString("email"));
				s.setPassword(rs.getString("password"));
				s.setImage(rs.getString("image"));

			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}  
		
		return s;
	}
	
	
	public List<Student> getAllStudent(){
		
		String sql = "select * from student";
		List<Student> studentlist = new ArrayList<Student>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Student s = new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setContact(rs.getString("contact"));
				s.setEmail(rs.getString("email"));
				s.setUsername(rs.getNString("username"));
				s.setImage(rs.getString("image"));
				
				studentlist.add(s);
			}
			return studentlist;
		}
		catch (Exception e) {
			e.printStackTrace();
		} 
		
		return null;
	}
	
	
	public boolean deleteStudent(int id) {
		String sql = "delete from student where id=?";
		
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

	
	
	public Student getStudentById(int id) {
		String sql = "select * from student where id=?";
		 
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			Student s = new Student();
			
			while(rs.next()){
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setContact(rs.getString("contact"));
				s.setEmail(rs.getString("email"));
				s.setPassword(rs.getString("password"));
				s.setImage(rs.getString("image"));
			}
			return s;
		}
		 catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
public List<Student> searchStudentsByName(String name){
		
		String sql = "select * from student where name like '%"+name+"%' ";
		List<Student> studentlist = new ArrayList<Student>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Student s = new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setContact(rs.getString("contact"));
				s.setEmail(rs.getString("email"));
				s.setUsername(rs.getNString("username"));
				s.setImage(rs.getString("image"));
				
				studentlist.add(s);
			}
			return studentlist;
		}
		catch (Exception e) {
			e.printStackTrace();
		} 
		
		return null;
	}
	
	
	
	

	public boolean updateStudent(Student s) {
		String sql = "update student set name=?, contact=?, email=?, password=?, image=? where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, s.getName());
			ps.setString(2, s.getContact());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getPassword());
			ps.setString(5, s.getImage());
			ps.setInt(6, s.getId());
			
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
	
	
	
}
