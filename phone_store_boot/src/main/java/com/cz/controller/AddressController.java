package com.cz.controller;

import com.cz.exception.PhoneException;
import com.cz.form.AddressForm;
import com.cz.service.AddressService;
import com.cz.util.ResultVOUtil;
import com.cz.vo.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Slf4j
@CrossOrigin
@RestController
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressService addressService;

    @GetMapping("/list")
    public ResultVO list() {
        return ResultVOUtil.success(addressService.findAll());
    }

    @PostMapping("/create")
    public ResultVO create(@Valid @RequestBody AddressForm addressForm, BindingResult bindingResult){
        //@RequestBody  将前端的json转为对象，Valid 进行数据校验，将信息返回到BindingResult
        if (bindingResult.hasErrors()){
            log.error("【添加地址】参数错误，addressForm={}",addressForm);
            throw new PhoneException(bindingResult.getFieldError().getDefaultMessage());
        }
        addressService.saveOrUpdate(addressForm);

        return ResultVOUtil.success(null);
    }

    @PutMapping("/update")
    public ResultVO update(@Valid @RequestBody AddressForm addressForm, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            log.error("【添加地址】参数错误，addressForm={}",addressForm);
            throw new PhoneException(bindingResult.getFieldError().getDefaultMessage());
        }
        addressService.saveOrUpdate(addressForm);

        return ResultVOUtil.success(null);
    }

}
