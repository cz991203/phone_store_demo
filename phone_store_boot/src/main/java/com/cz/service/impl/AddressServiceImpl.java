package com.cz.service.impl;

import com.cz.entity.BuyerAddress;
import com.cz.form.AddressForm;
import com.cz.repository.BuyerAddressRepository;
import com.cz.service.AddressService;
import com.cz.vo.AddressVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class AddressServiceImpl implements AddressService {

    @Resource
    private BuyerAddressRepository buyerAddressRepository;

    @Transactional
    @Override
    public List<AddressVO> findAll() {
        List<BuyerAddress> buyerAddressList = buyerAddressRepository.findAll();

        List<AddressVO> addressVOList = buyerAddressList.stream().map(
                e -> new AddressVO(
                        e.getAddressId(),
                        e.getAreaCode(),
                        e.getBuyerName(),
                        e.getBuyerPhone(),
                        e.getBuyerAddress()
                )).collect(Collectors.toList());
        return addressVOList;
    }

    @Transactional
    @Override
    public void saveOrUpdate(AddressForm addressForm) {
        BuyerAddress buyerAddress;
        if (addressForm.getId() == null){
            buyerAddress = new BuyerAddress();

        }else {
            buyerAddress = buyerAddressRepository.findById(addressForm.getId()).get();
        }

            buyerAddress.setBuyerName(addressForm.getName());

            buyerAddress.setBuyerPhone(addressForm.getTel());

            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append(addressForm.getProvince())
                    .append(addressForm.getCity())
                    .append(addressForm.getCounty())
                    .append(addressForm.getAddressDetail());
            buyerAddress.setBuyerAddress(stringBuffer.toString());

            buyerAddress.setAreaCode(addressForm.getAreaCode());


            buyerAddressRepository.save(buyerAddress);

    }
}
