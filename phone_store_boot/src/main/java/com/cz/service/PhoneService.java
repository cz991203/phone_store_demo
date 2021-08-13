package com.cz.service;

import com.cz.vo.DataVO;
import com.cz.vo.PhoneInfoVO;
import com.cz.vo.SpecsPackageVO;

import java.util.List;

public interface PhoneService {

    DataVO findDataVO();

    List<PhoneInfoVO> findPhoneInfoVOByCategoryType(Integer categoryType);

    SpecsPackageVO findSpecsByPhoneId(Integer phoneId);

    void subStock(Integer specsId,Integer quantity);

}
