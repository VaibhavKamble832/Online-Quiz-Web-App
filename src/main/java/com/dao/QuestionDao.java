package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbcon.DBConnect;
import com.pojo.Questions;
import com.pojo.Student;

public class QuestionDao {

	Connection con = DBConnect.getConnection();
	
	public boolean addQuestion(Questions q) {
		String sql = "insert into questions(question_name, opt1, opt2, opt3, opt4, ans, subject_id) values(?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, q.getQuestion());
			ps.setString(2, q.getOpt1());
			ps.setString(3, q.getOpt2());
			ps.setString(4, q.getOpt3());
			ps.setString(5, q.getOpt4());
			ps.setString(6, q.getAns());
			ps.setInt(7, q.getSubject_id());
			
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
	
	public List<Questions> getAllQuestions(){
		
		String sql = " select q.id, q.question_name, q.opt1, q.opt2, q.opt3, q.opt4, q.ans, s.subject_name as Subject from questions q inner join subjects s on s.id = q.subject_id";
		List<Questions> qlist = new ArrayList<Questions>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Questions q = new Questions();
				q.setId(rs.getInt("id"));
				q.setQuestion(rs.getString("question_name"));
				q.setOpt1(rs.getString("Opt1"));
				q.setOpt2(rs.getString("Opt2"));
				q.setOpt3(rs.getString("Opt3"));
				q.setOpt4(rs.getString("Opt4"));
				q.setAns(rs.getString("Ans"));
				q.setSubject_name(rs.getString("Subject"));
				
				
				qlist.add(q);
			}
			return qlist;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
public List<Questions> getAllQuestions(int start){
		
		String sql = "select q.id, q.question_name, q.opt1, q.opt2, q.opt3, q.opt4, q.ans, s.subject_name as Subject from questions q inner join subjects s on s.id = q.subject_id limit"+start+",7";
		List<Questions> qlist = new ArrayList<Questions>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Questions q = new Questions();
				q.setId(rs.getInt("id"));
				q.setQuestion(rs.getString("question_name"));
				q.setOpt1(rs.getString("Opt1"));
				q.setOpt2(rs.getString("Opt2"));
				q.setOpt3(rs.getString("Opt3"));
				q.setOpt4(rs.getString("Opt4"));
				q.setAns(rs.getString("Ans"));
				q.setSubject_name(rs.getString("Subject"));
				
				qlist.add(q);
			}
			return qlist;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
public List<Questions> getAllQuestionsBySubject(int id){
		
		String sql = " select q.id, q.question_name, q.opt1, q.opt2, q.opt3, q.opt4, q.ans, s.subject_name as Subject from questions q inner join subjects s on s.id = q.subject_id where subject_id=?";
		List<Questions> qlist = new ArrayList<Questions>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Questions q = new Questions();
				q.setId(rs.getInt("id"));
				q.setQuestion(rs.getString("question_name"));
				q.setOpt1(rs.getString("Opt1"));
				q.setOpt2(rs.getString("Opt2"));
				q.setOpt3(rs.getString("Opt3"));
				q.setOpt4(rs.getString("Opt4"));
				q.setAns(rs.getString("Ans"));
				q.setSubject_name(rs.getString("Subject"));
				
				
				qlist.add(q);
			}
			return qlist;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	


	
	
	public boolean deleteQuestion(int id) {
		String sql = "delete from questions where id=?";
		
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
	
	public Questions getQuestionById(int id) {
		String sql = "select * from questions where id=?";
		 
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			Questions q = new Questions();
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				q.setId(rs.getInt("id"));
				q.setQuestion(rs.getString("question_name"));
				q.setOpt1(rs.getString("Opt1"));
				q.setOpt2(rs.getString("Opt2"));
				q.setOpt3(rs.getString("Opt3"));
				q.setOpt4(rs.getString("Opt4"));
				q.setAns(rs.getString("Ans"));
				q.setSubject_id(rs.getInt("subject_id"));
			}
			return q;
		}
		 catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public boolean updateQuestion(Questions q) {
		String sql = "update questions set question_name=?, opt1=?, opt2=?, opt3=?, opt4=?, ans=?, subject_id=? where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, q.getQuestion());
			ps.setString(2, q.getOpt1());
			ps.setString(3, q.getOpt2());
			ps.setString(4, q.getOpt3());
			ps.setString(5, q.getOpt4());
			ps.setString(6, q.getAns());
			ps.setInt(7, q.getSubject_id());
			ps.setInt(8, q.getId());
			
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
