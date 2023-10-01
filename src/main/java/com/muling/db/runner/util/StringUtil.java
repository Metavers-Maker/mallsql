package com.muling.db.runner.util;

import org.springframework.util.StringUtils;

import java.util.Collection;

public class StringUtil {

    public static boolean isEmpty(String str){
        return StringUtils.isEmpty(str);
    }

    public static boolean isNotEmpty(String str){
        return !StringUtils.isEmpty(str);
    }

    public static void splitTo(String source, String split, Collection<String> target){
        if (isEmpty(source) || target == null){
            return;
        }
        String[] array = source.split(split);
        for (int i = 0; i < array.length; i++) {
            if (isNotEmpty(array[i])){
                target.add(array[i]);
            }
        }
    }

    public static void splitToWithComma(String source, Collection<String> target){
        splitTo(source, ",", target);
    }
}