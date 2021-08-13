package com.cz.service;

import com.cz.dto.OrderDTO;
import com.cz.vo.OrderDetailVO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class OrderServiceTest {

    @Autowired
    private OrderService orderService;

    @Test
    void create() {
        OrderDTO orderDTO = new OrderDTO();
        orderDTO.setBuyerName("lisi");
        orderDTO.setBuyerPhone("13656565656");
        orderDTO.setBuyerAddress("打了款i金币；哦啊额日u回个话吧");
        orderDTO.setPhoneQuantity(1);
        orderDTO.setSpecsId(1);

        System.out.println(orderService.create(orderDTO).getOrderId());
    }

    @Test
    void findOrderDetailByOrderId() {

       OrderDetailVO orderDetailVO =  orderService.findOrderDetailByOrderId("1626259977126441443");
       int a = 1;
    }

    @Test
    void pay() {
        System.out.println(orderService.pay("1626260160979588281"));
    }
}
