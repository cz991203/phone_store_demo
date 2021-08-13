package com.cz.repository;

import com.cz.entity.OrderMaster;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class OrderMasterRepositoryTest {

    @Autowired
    private OrderMasterRepository repository;

    @Test
    void findAll(){
        repository.findAll();
    }

    @Test
    void save(){
        OrderMaster orderMaster = new OrderMaster();
        orderMaster.setOrderId(UUID.randomUUID().toString().replaceAll("-",""));
        orderMaster.setBuyerName("zhangsan");
        orderMaster.setBuyerPhone("13630704543");
        orderMaster.setBuyerAddress("ualisrhbar");
        orderMaster.setOrderAmount(new BigDecimal(6400));
        orderMaster.setPayStatus(0);
        orderMaster.setPhoneIcon("../static/e84a2e03-7f19-41d2-98a5-a5c16b7e252d.jpg");
        orderMaster.setPhoneId(1);
        orderMaster.setPhoneName("Honor 8A");
        orderMaster.setPhoneQuantity(2);
        orderMaster.setSpecsId(1);
        orderMaster.setSpecsName("32GB");
        orderMaster.setSpecsPrice(new BigDecimal(320000));
       repository.save(orderMaster);
    }

    @Test
    void findById(){
        OrderMaster orderMaster = repository.findById("3ee5863ae76a4dcbbc9dcee4b25720e0").get();
        System.out.println(orderMaster);
    }

    @Test
    void pay(){
        OrderMaster orderMaster =  repository.findById("3ee5863ae76a4dcbbc9dcee4b25720e0").get();
        orderMaster.setPayStatus(0);
        repository.save(orderMaster);
    }

}
