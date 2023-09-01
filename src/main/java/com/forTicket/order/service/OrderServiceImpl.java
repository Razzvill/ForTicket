package com.forTicket.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.order.dao.OrderDAO;
import com.forTicket.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;
	
	//예매추가
	@Override
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception {
		orderDAO.insertNewOrder(myOrderList);		
	}

	//예매상세
	@Override
	public OrderVO ticketDetail(int order_No) throws Exception {
		OrderVO order = orderDAO.ticketDetail(order_No);
		return order;
	}

	//환불 성공
	@Override
	public void refundSuccess(int order_No) throws DataAccessException {
		orderDAO.refundSuccess(order_No);
	}
	
}
