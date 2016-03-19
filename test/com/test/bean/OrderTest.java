package com.test.bean;

import static org.junit.Assert.*;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.test.util.HibernateSessionFactory;

public class OrderTest {

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
	public void testWhere5() {
		String hql = "from Orderform o where o.orderitems is not empty";
		Query query = session.createQuery(hql);
		List<Orderform> orderforms = query.list();
		for (Orderform orderform : orderforms) {
			System.out.println(orderform.getCustomer().getName());
			System.out.println(orderform.getAmount());
			System.out.println(orderform.getTradedate());
		}
	}

}
