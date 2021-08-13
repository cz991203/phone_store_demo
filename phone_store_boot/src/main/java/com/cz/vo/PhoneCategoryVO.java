package com.cz.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PhoneCategoryVO {

    @JsonProperty("name")  //转成json后的属性key名字
    private String categoryName;
    @JsonProperty("type")
    private Integer categoryType;


}
