package com.cz.service.impl;

import com.cz.entity.PhoneCategory;
import com.cz.entity.PhoneInfo;
import com.cz.entity.PhoneSpecs;
import com.cz.eunms.ResultEnum;
import com.cz.exception.PhoneException;
import com.cz.repository.PhoneCategoryRepository;
import com.cz.repository.PhoneInfoRepository;
import com.cz.repository.PhoneSpecsRepository;
import com.cz.service.PhoneService;
import com.cz.util.PhoneUtil;
import com.cz.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Slf4j
public class PhoneServiceImpl implements PhoneService {

    @Autowired
    private PhoneInfoRepository phoneInfoRepository;

    @Autowired
    private PhoneCategoryRepository phoneCategoryRepository;

    @Autowired
    private PhoneSpecsRepository phoneSpecsRepository;
    @Transactional
    @Override
    public DataVO findDataVO() {
        DataVO dataVO = new DataVO();
        //类型
        List<PhoneCategory> phoneCategories = phoneCategoryRepository
                .findAll();
        /*
            常规循环集合进行赋值
         */
        //2、java8新特性 stream
        List<PhoneCategoryVO> phoneCategoryVOList =  phoneCategories.stream()
                .map(e -> new PhoneCategoryVO(e.getCategoryName(),e.getCategoryType()
                )).collect(Collectors.toList());

        dataVO.setCategories(phoneCategoryVOList);
        //手机

        List<PhoneInfo> phoneInfoList = phoneInfoRepository
                .findAllByCategoryType(phoneCategories.get(0).getCategoryType());

        List<PhoneInfoVO> phoneInfoVOList = phoneInfoList.stream()
                .map(e -> new PhoneInfoVO(
                        e.getPhoneId(),
                        e.getPhoneName(),
                        e.getPhonePrice().doubleValue()+"",
                        e.getPhoneDescription(),
                        PhoneUtil.createTag(e.getPhoneTag()),
                        e.getPhoneIcon()
                )).collect(Collectors.toList());

        dataVO.setPhones(phoneInfoVOList);

        return dataVO;
    }

    @Transactional
    @Override
    public List<PhoneInfoVO> findPhoneInfoVOByCategoryType(Integer categoryType) {

        List<PhoneInfo> phoneInfoList = phoneInfoRepository
                .findAllByCategoryType(categoryType);

        List<PhoneInfoVO> phoneInfoVOList = phoneInfoList.stream()
                .map(e -> new PhoneInfoVO(
                        e.getPhoneId(),
                        e.getPhoneName(),
                        e.getPhonePrice().doubleValue()+"",
                        e.getPhoneDescription(),
                        PhoneUtil.createTag(e.getPhoneTag()),
                        e.getPhoneIcon()
                )).collect(Collectors.toList());

        return phoneInfoVOList;
    }

    @Transactional
    @Override
    public SpecsPackageVO findSpecsByPhoneId(Integer phoneId) {

        PhoneInfo phoneInfo = phoneInfoRepository.findById(phoneId).get();
        List<PhoneSpecs> phoneSpecsList = phoneSpecsRepository.findAllByPhoneId(phoneId);

        //sku
        SkuVO skuVO = new SkuVO();

        //tree

        List<PhoneSpecsVO> phoneSpecsVOList = new ArrayList<>();
        List<PhoneSpecsCaseVO> phoneSpecsCaseVOList = new ArrayList<>();

        PhoneSpecsVO phoneSpecsVO;
        PhoneSpecsCaseVO phoneSpecsCaseVO;
        for (PhoneSpecs phoneSpecs : phoneSpecsList) {
            phoneSpecsVO = new PhoneSpecsVO();
            phoneSpecsCaseVO = new PhoneSpecsCaseVO();

            BeanUtils.copyProperties(phoneSpecs,phoneSpecsVO);
            BeanUtils.copyProperties(phoneSpecs,phoneSpecsCaseVO);

            phoneSpecsVOList.add(phoneSpecsVO);
            phoneSpecsCaseVOList.add(phoneSpecsCaseVO);
        }

        List<TreeVO> treeVOList = new ArrayList<>();
        TreeVO treeVO = new TreeVO();
        treeVO.setV(phoneSpecsVOList);
        treeVOList.add(treeVO);

        //sku-price
        Double price = phoneInfo.getPhonePrice().doubleValue();
        skuVO.setPrice(price.toString());
        //sku-stock_num
        skuVO.setStock_num(phoneInfo.getPhoneStock());
        //sku-Tree
        skuVO.setTree(treeVOList);
        //sku-List
        skuVO.setList(phoneSpecsCaseVOList);

        //specspackagevo
        SpecsPackageVO specsPackageVO = new SpecsPackageVO();
        specsPackageVO.setSku(skuVO);
        Map<String,String>  goods = new HashMap<>();
        goods.put("picture",phoneInfo.getPhoneIcon());
        specsPackageVO.setGoods(goods);

        return specsPackageVO;
    }

    @Transactional
    @Override
    public void subStock(Integer specsId, Integer quantity) {

        PhoneSpecs phoneSpecs = phoneSpecsRepository.findById(specsId).get();
        PhoneInfo phoneInfo = phoneInfoRepository.findById(phoneSpecs.getPhoneId()).get();
        Integer result = phoneSpecs.getSpecsStock() - quantity;
        if(result < 0){
           log.error("[扣库存]库存不足");
           throw new PhoneException(ResultEnum.PHONE_STOCK_ERROR);
        }

        phoneSpecs.setSpecsStock(result);
        phoneSpecsRepository.save(phoneSpecs);

        result = phoneInfo.getPhoneStock() - quantity;
        if(result < 0){
            log.error("[扣库存]库存不足");
            throw new PhoneException(ResultEnum.PHONE_STOCK_ERROR);
        }

        phoneInfo.setPhoneStock(result);
        phoneInfoRepository.save(phoneInfo);
    }
}
