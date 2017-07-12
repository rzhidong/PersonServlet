package com.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBUtil;
import com.vo.Person;

public class PersonAction {
	
	private static Connection  connection;
	
	private static PreparedStatement pdst;
	
	private static ResultSet resultSet;
	
	public static boolean addPerson(Person person){
		
		boolean flag = false;
		
		connection = DBUtil.getConnection();
		
		String sql = "insert into person(name,age,sex,major,college,introduction) "
				+ "values(?,?,?,?,?,?)";
		
		try {
			pdst = connection.prepareStatement(sql);
			
			pdst.setString(1, person.getName());
			pdst.setInt(2, person.getAge());
			pdst.setInt(3, person.getSex());
			pdst.setString(4, person.getMajor());
			pdst.setString(5, person.getCollege());
			pdst.setString(6, person.getIntroduction());
			
			pdst.execute();
			
			flag = true;
			
			closeDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	public static boolean updatePerson(Person person){
		
		boolean flag = false;
		
		connection = DBUtil.getConnection();
		
		String sql = "update person set name=?,age=?,sex=?,major=?,college=?,introduction=? "
				+ "where id=?";
		
		try {
			pdst = connection.prepareStatement(sql);
			
			pdst.setString(1, person.getName());
			pdst.setInt(2, person.getAge());
			pdst.setInt(3, person.getSex());
			pdst.setString(4, person.getMajor());
			pdst.setString(5, person.getCollege());
			pdst.setString(6, person.getIntroduction());
			pdst.setInt(7, person.getId());
			
			pdst.execute();
			
			flag = true;
			
			closeDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public static boolean deletePerson(int id){
		boolean flag = false;
		
		connection = DBUtil.getConnection();
		
		String sql = "delete from person where id = ?";
		
		try {
			pdst = connection.prepareStatement(sql);
			
			pdst.setInt(1, id);
			pdst.execute();
			
			flag = true;
			
			closeDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public static List<Person> getAllPersons(){
		
		List<Person> lists = new ArrayList<Person>();
		
		Person person;
		
		String sql = "select * from person";
		
		connection = DBUtil.getConnection();
		
		try {
			pdst = connection.prepareStatement(sql);
			
			pdst.execute();
			
			resultSet = pdst.getResultSet();
			while (resultSet.next()){
				person = new Person();
				person.setId(resultSet.getInt("id"));
				person.setName(resultSet.getString("name"));
				person.setAge(resultSet.getInt("age"));
				person.setSex(resultSet.getInt("sex"));
				person.setMajor(resultSet.getString("major"));
				person.setCollege(resultSet.getString("college"));
				person.setIntroduction(resultSet.getString("introduction"));
				lists.add(person);
			}
			
			closeDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return lists;
	}

	public static Person getOnePerson(int id){
		
		Person  person = null;
		
		connection = DBUtil.getConnection();
		
		String sql = "select * from person where id = ?";
		
		try {
			pdst = connection.prepareStatement(sql);
			pdst.setInt(1, id);
			
			resultSet = pdst.executeQuery();
			while (resultSet.next()){
				person = new Person();
				person.setId(resultSet.getInt("id"));
				person.setName(resultSet.getString("name"));
				person.setAge(resultSet.getInt("age"));
				person.setSex(resultSet.getInt("sex"));
				person.setMajor(resultSet.getString("major"));
				person.setCollege(resultSet.getString("college"));
				person.setIntroduction(resultSet.getString("introduction"));
			}
			closeDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return person;
	}
	
	private static void closeDB(){
		if (connection != null) {
			DBUtil.closeConnecton(connection);
		}
		if (pdst != null) {
			try {
				pdst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
