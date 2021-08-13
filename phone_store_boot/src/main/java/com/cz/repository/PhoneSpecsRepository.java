package com.cz.repository;

import com.cz.entity.PhoneSpecs;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PhoneSpecsRepository extends JpaRepository<PhoneSpecs,Integer> {
    List<PhoneSpecs> findAllByPhoneId(Integer id);
}
