package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbcon.DBConnect;
import com.pojo.Result;

public class ResultDao {
	
	Connection con = DBConnect.getConnection();
	
	public boolean addResult(Result r) {
		
		String sql = "insert into student_result(student_name, subject_id, marks, result) values(?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, r.getStudent_name());
			ps.setInt(2, r.getSubject_id());
			ps.setString(3, r.getMarks());
			ps.setString(4, r.getResult());
			
			int i=ps.executeUpdate();
			if(i>0) {
				return true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	
	public List<Result> getAllResult(){
		
		String sql = "select sr.id, sr.student_name, sr.marks, sr.result, sr.attempt_date, su.subject_name as subject from student_result sr inner join subjects su on sr.subject_id = su.id";
		List<Result> resultList = new ArrayList<Result>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Result r = new Result();
				r.setId(rs.getInt("id"));
				r.setStudent_name(rs.getString("student_name"));
				r.setSubject_name(rs.getString("subject"));
				r.setMarks(rs.getString("marks"));
				r.setResult(rs.getString("result"));
				r.setAttempt_date(rs.getString("attempt_date"));
				
				resultList.add(r);
			}
			return resultList;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Result> getResultByStudent(String name){
		
		String sql = " select sr.id, sr.student_name, sr.marks, sr.result, sr.attempt_date, su.subject_name as subject from student_result sr inner join subjects su on sr.subject_id = su.id where sr.student_name like '%"+name+"%' ";
		List<Result> resultList = new ArrayList<Result>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Result r = new Result();
				r.setId(rs.getInt("id"));
				r.setStudent_name(rs.getString("student_name"));
				r.setSubject_name(rs.getString("subject"));
				r.setMarks(rs.getString("marks"));
				r.setResult(rs.getString("result"));
				r.setAttempt_date(rs.getString("attempt_date"));
				
				resultList.add(r);
			}
			return resultList;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public List<Result> getResultBySubject(int subjectId){
		
		String sql = "select sr.id, sr.student_name, sr.marks, sr.result, sr.attempt_date, su.subject_name as subject from student_result sr inner join subjects su on sr.subject_id = su.id where sr.subject_id = ?";
		List<Result> resultList = new ArrayList<Result>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, subjectId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Result r = new Result();
				r.setId(rs.getInt("id"));
				r.setStudent_name(rs.getString("student_name"));
				r.setSubject_name(rs.getString("subject"));
				r.setMarks(rs.getString("marks"));
				r.setResult(rs.getString("result"));
				r.setAttempt_date(rs.getString("attempt_date"));
				
				resultList.add(r);
			}
			return resultList;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
public List<Result> getResultByResult(String result){
		
		String sql = " select sr.id, sr.student_name, sr.marks, sr.result, sr.attempt_date, su.subject_name as subject from student_result sr inner join subjects su on sr.subject_id = su.id where sr.result like '%"+result+"%' ";
		List<Result> resultList = new ArrayList<Result>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Result r = new Result();
				r.setId(rs.getInt("id"));
				r.setStudent_name(rs.getString("student_name"));
				r.setSubject_name(rs.getString("subject"));
				r.setMarks(rs.getString("marks"));
				r.setResult(rs.getString("result"));
				r.setAttempt_date(rs.getString("attempt_date"));
				
				resultList.add(r);
			}
			return resultList;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	
	
}
