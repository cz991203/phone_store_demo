package com.cz.repository;

import com.cz.entity.PhoneInfo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PhoneInfoRepositoryTest {

    @Autowired
    private PhoneInfoRepository repository;

    @Test
    public void findAll(){
        List<PhoneInfo> list = repository.findAll();
        list.forEach(System.out::println);
    }

    @Test
    public void findAllByCategoryType(){
        List<PhoneInfo> list = repository.findAllByCategoryType(2);
        list.forEach(System.out::println);
    }
}
