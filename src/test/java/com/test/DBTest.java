package com.test;

import com.action.PersonAction;
import com.vo.Person;

public class DBTest {
	
	public static void main(String[] args) {
		Person person = new Person();
		
		person.setId(3);
		person.setName("hello");
		person.setAge(22);
		person.setSex(1);
		person.setMajor("�����");
		person.setCollege("�����ѧԺ");
		person.setIntroduction("ŶŶŶ���˵��������ϵõ�");
		
		//System.out.println(PersonAction.addPerson(person));
		System.out.println(PersonAction.getAllPersons());
		System.out.println(PersonAction.getOnePerson(4));
	}

}
