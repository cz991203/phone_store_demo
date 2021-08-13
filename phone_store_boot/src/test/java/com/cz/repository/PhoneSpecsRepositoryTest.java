package com.cz.repository;

import com.cz.entity.PhoneSpecs;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PhoneSpecsRepositoryTest {

    @Autowired
    private PhoneSpecsRepository repository;

    @Test
    public void findAll(){
        List<PhoneSpecs> list = repository.findAll();
        list.forEach(System.out::println);
    }

    @Test
    public  void  findAllByPhoneId(){
        List<PhoneSpecs> list = repository.findAllByPhoneId(1);
        list.forEach(System.out::println);
    }


}
