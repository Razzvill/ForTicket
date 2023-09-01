package com.forTicket.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.order.vo.OrderVO;

@Mapper
@Repository("orderDAO")
public interface OrderDAO {
	//예매
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException;

	//예매상세
	public  OrderVO ticketDetail(int order_No) throws DataAccessException;
}
