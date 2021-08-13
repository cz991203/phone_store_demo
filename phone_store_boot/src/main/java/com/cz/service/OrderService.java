package com.cz.service;

import com.cz.dto.OrderDTO;
import com.cz.vo.OrderDetailVO;

public interface OrderService {
    OrderDTO create(OrderDTO orderDTO);

    OrderDetailVO findOrderDetailByOrderId(String orderId);

    String pay(String orderId);
}
