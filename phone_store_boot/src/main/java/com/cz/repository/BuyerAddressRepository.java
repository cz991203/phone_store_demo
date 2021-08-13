package com.cz.repository;

import com.cz.entity.BuyerAddress;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BuyerAddressRepository extends JpaRepository<BuyerAddress,Integer> {
   // void saveBuyerAddress(BuyerAddress buyerAddress);

}
