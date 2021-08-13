package com.cz.eunms;

import lombok.Getter;

@Getter
public enum ResultEnum {

    PHONE_STOCK_ERROR(0,"手机库存不足"),
    ORDER_STATUS_ERROE(1,"请勿重复支付"),
    ORDER_NOT_EXIST(2,"订单不为空");

    private Integer code;
    private String msg;


    ResultEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

}
