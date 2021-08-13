package com.cz.repository;

import com.cz.entity.PhoneCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PhoneCategoryRepository extends JpaRepository<PhoneCategory,Integer> {

    PhoneCategory findByCategoryType(Integer categoryType);

}
