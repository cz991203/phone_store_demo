package com.cz.service;

import com.cz.vo.SpecsPackageVO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PhoneServiceTest {

    @Autowired
    private PhoneService service;

    @Test
    void findDataVO() {
    }

    @Test
    void findPhoneInfoVOByCategoryType() {
    }

    @Test
    void findSpecsByPhoneId() {
        SpecsPackageVO specsPackageVO = service.findSpecsByPhoneId(1);
        int id = 0;

    }

    @Test
    void subStock() {
        service.subStock(1,1);
    }
}
