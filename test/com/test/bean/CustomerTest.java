package com.test.bean;

import static org.junit.Assert.*;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.test.util.HibernateSessionFactory;

public class CustomerTest {

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
		String hql = "from Customer";
		Query query = session.createQuery(hql);
		List<Customer> customers = query.list();
		for (Customer customer : customers) {
			System.out.println(customer);
		}
	}
	
	@Test
	public void testWhere7() {
		String hql = "from Customer c where c.name = '张三'";
		Query query = session.createQuery(hql);
		Customer customer = (Customer) query.uniqueResult();
		System.out.println(customer.getName());
	}
	
	@Test
	public void testDistinct() {
		String hql = "select distinct c.sex from Customer c";
		Query query = session.createQuery(hql);
		List<Object> list = query.list();
		for (Object object : list) {
			System.out.println(object);
		}
	}
	
	@Test
	public void testWhere2() {
		String hql = "from Customer c where c.age not between ? and ?";
		Query query = session.createQuery(hql)
				.setParameter(0, 25)
				.setParameter(1, 35);
		List<Customer> customers = query.list();
		for (Customer customer : customers) {
			System.out.println(customer.getName());
			System.out.println(customer.getAge());
		}
	}
	
	@Test
	public void testWhere3() {
		String hql = "from Customer c where c.address like '%北京%'";
		Query query = session.createQuery(hql);
		List<Customer> customers = query.list();
		for (Customer customer : customers) {
			System.out.println(customer.getName());
			System.out.println(customer.getAddress());
		}
	}
}
