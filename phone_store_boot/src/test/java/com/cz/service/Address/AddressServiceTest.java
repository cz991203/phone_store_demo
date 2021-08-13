package com.cz.service.Address;

import com.cz.form.AddressForm;
import com.cz.service.AddressService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class AddressServiceTest {

    @Autowired
    private AddressService addressService;

    @Test
    void saveOrUpdate() {
        AddressForm addressForm = new AddressForm();
        //addressForm.setId(35);
        addressForm.setName("李四");
        addressForm.setTel("1232512355");
        addressForm.setProvince("北京市");
        addressForm.setCity("北京市");
        addressForm.setCounty("海淀区");
        addressForm.setAreaCode("110101");
        addressForm.setAddressDetail("168号306室");
        addressService.saveOrUpdate(addressForm);
    }
}
