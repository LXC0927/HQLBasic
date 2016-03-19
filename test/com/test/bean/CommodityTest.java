package com.test.bean;

import static org.junit.Assert.*;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.test.util.HibernateSessionFactory;

public class CommodityTest {

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
		String hql = "from Commodity";
		Query query = session.createQuery(hql);
		List<Commodity> commodities = query.list();
		for (Commodity commodity : commodities) {
			System.out.println("name:"+commodity.getName());
			
			System.out.println("seller's name:"+commodity.getSeller().getName());
		}
	}
	@Test
	public void testOrderby() {
		String hql = "from Commodity order by seller.id asc,price desc,name asc";
		Query query = session.createQuery(hql);
		List<Commodity> commodities = query.list();
		for (Commodity commodity : commodities) {
			System.out.println("name:"+commodity.getName());
			System.out.println("seller:"+commodity.getSeller().getName());
			System.out.println("price:"+commodity.getPrice());
		}
	}

	@Test
	public void testWhere1() {
		String hql = "from Commodity c where c.price>400";
		Query query = session.createQuery(hql);
		List<Commodity> commodities = query.list();
		for (Commodity commodity : commodities) {
			System.out.println("name:"+commodity.getName());			
			System.out.println("price:"+commodity.getPrice());
		}
	}
	
	@Test
	public void testWhere1null() {
		String hql = "from Commodity c where c.description = null";
		Query query = session.createQuery(hql);
		List<Commodity> commodities = query.list();
		for (Commodity commodity : commodities) {
			System.out.println("name:"+commodity.getName());			
			System.out.println("destription:"+commodity.getDescription());
		}
	}
	
	@Test
	public void testWhere4() {
		String hql = "from Commodity c where c.price between 100 and 5000 or c.category like '%电脑%'";
		Query query = session.createQuery(hql);
		List<Commodity> commodities = query.list();
		for (Commodity commodity : commodities) {
			System.out.println("name:"+commodity.getName());			
			System.out.println("price:"+commodity.getPrice());
			System.out.println(commodity.getCategory());
		}
	}
	
	@Test
	public void testWhere6() {
		String hql = "from Commodity c where c.price*5 > 3000 ";
		Query query = session.createQuery(hql);
		List<Commodity> commodities = query.list();
		for (Commodity commodity : commodities) {
			System.out.println("name:"+commodity.getName());			
			System.out.println("price:"+commodity.getPrice()*5);
		}
	}
}
