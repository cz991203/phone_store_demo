package com.cz.eunms;

import lombok.Getter;

@Getter
public enum PayStatusEnum {

    UNPAY(0,"未支付"),
    PAY(1,"已支付");

    private Integer code;
    private String msg;

    PayStatusEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
