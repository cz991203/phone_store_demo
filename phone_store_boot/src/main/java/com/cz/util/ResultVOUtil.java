package com.cz.util;

import com.cz.vo.ResultVO;

public class ResultVOUtil {
    public static ResultVO success(Object data){
        ResultVO resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("成功");
        resultVO.setData(data);

        return resultVO;
    }

    public static ResultVO error(String error){
        ResultVO resultVO = new ResultVO();
        resultVO.setCode(1);
        resultVO.setMsg(error);
        resultVO.setMsg(null);
        return resultVO;
    }
}
