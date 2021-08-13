package com.cz.service;

import com.cz.form.AddressForm;
import com.cz.vo.AddressVO;

import java.util.List;

public interface AddressService {
    List<AddressVO> findAll();

    void saveOrUpdate(AddressForm addressForm);
}
