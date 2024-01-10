package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbcon.DBConnect;
import com.pojo.Instructions;

public class InstructionDao {

	Connection con = DBConnect.getConnection();


	public boolean addInstruction(Instructions i) {
		String sql = "insert into instructions(instruction) values(?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, i.getInstruction());

			int check = ps.executeUpdate();
			if(check > 0) {
				return true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	
	public List<Instructions> getAllInstructions(){
		String sql = "select * from instructions";
		List<Instructions> iList = new ArrayList<Instructions>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Instructions i = new Instructions();
				i.setId(rs.getInt("id"));
				i.setInstruction(rs.getString("instruction"));
				
				iList.add(i);
			}
			return iList; 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public boolean deleteInstructions(int id) {
		String sql = "delete from instructions where id=?";
		
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
	
	
	
	public boolean editInstruction(Instructions i) {
		String sql = "update instructions set instruction=? where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, i.getInstruction());
			ps.setInt(2, i.getId());
			
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
	
	
	public Instructions getInstructionById(int id) {
		String sql = "select * from instructions where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			Instructions i = new Instructions();
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				i.setId(rs.getInt(1));
				i.setInstruction(rs.getString(2));
				
			}
			return i;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	
}
