package com.wolong.convert;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 202007981
 * @Description 日期转换
 * @date 2020/11/28 15:28
 */
public class CustomDateConvert implements Converter<String, Date> {

    public Date convert(String source) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        try {
            return dateFormat.parse(source);
        } catch (Exception e) {
            //e.printStackTrace();
        }
        return null;
    }
}
