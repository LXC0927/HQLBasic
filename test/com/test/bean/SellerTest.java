package com.test.bean;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.test.util.HibernateSessionFactory;

public class SellerTest {

	private Session session = null;
	@Before
	public void setUp() throws Exception {
		session = HibernateSessionFactory.getSession();
	}

	@After
	public void tearDown() throws Exception {
		session.close();
	}

	@Test
	public void test() {
		String hql = "select s.name,s.tel,s.address,s.star from Seller as s";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		for (Object[] objects : list) {
			System.out.println(objects[0]);
			System.out.println(objects[1]);
			System.out.println(objects[2]);
			System.out.println(objects[3]);
		}
	}
	
	@Test
	public void testSelectClauseList(){
		String hql = "select new list(s.name,s.tel,s.address) from Seller s";
		Query query = session.createQuery(hql);
		List<List> lists = query.list();
		
		for (List list : lists) {
			System.out.println(list.get(0));
			System.out.println(list.get(1));
			System.out.println(list.get(2));
		}
	}
	
	@Test
	public void testSelectClauseMap(){
		String hql = "select new map(s.name,s.tel,s.address) from Seller s";
		Query query = session.createQuery(hql);
		List<Map> maps = query.list();
		
		for (Map map : maps) {
			System.out.println(map.get("0"));
			System.out.println(map.get("1"));
			System.out.println(map.get("2"));
		}
	}
	
	@Test
	public void testSelectClauseSelf(){
		String hql = "select new Seller(s.name,s.tel) from Seller s";
		Query query = session.createQuery(hql);
		List<Seller> sellers = query.list();
		
		for (Seller seller : sellers) {
			System.out.println(seller.getName());
			System.out.println(seller.getTel());
		}
	}

}
