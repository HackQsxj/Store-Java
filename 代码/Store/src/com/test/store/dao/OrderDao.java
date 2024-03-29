package com.test.store.dao;

import java.sql.Connection;
import java.util.List;

import com.test.store.domain.Order;
import com.test.store.domain.OrderItem;
import com.test.store.domain.User;

public interface OrderDao {

	void saveOrder(Connection conn, Order order) throws Exception;

	void saveOrderItem(Connection conn, OrderItem item) throws Exception;

	int getTotalRecords(String uid) throws Exception;

	List<Order> findMyOrdersWithPage(User user, int startIndex, int pageSize) throws Exception;

	Order findOrderByOid(String oid) throws Exception;

	void updateOrder(Order order) throws Exception;

	List<Order> findAllOrders() throws Exception;

	List<Order> findAllOrders(String state) throws Exception;

}
