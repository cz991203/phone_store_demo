package com.cz.repository;

import com.cz.entity.PhoneInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface PhoneInfoRepository extends JpaRepository<PhoneInfo, Integer> {

    List<PhoneInfo> findAllByCategoryType(Integer categoryType);

}
