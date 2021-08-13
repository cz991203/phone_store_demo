package com.cz.exception;

import com.cz.eunms.ResultEnum;

public class PhoneException  extends  RuntimeException{

    public PhoneException(ResultEnum resultEnum){
        super(resultEnum.getMsg());
    }

    public PhoneException(String message) {
        super(message);
    }
}
