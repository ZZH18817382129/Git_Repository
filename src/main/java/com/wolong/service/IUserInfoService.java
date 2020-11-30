package com.wolong.service;

import com.wolong.model.UserInfo;

/**
 * @author 202007981
 * @Description
 * @date 2020/11/30 14:23
 */
public interface IUserInfoService {
    int confirmUserName(String userName);

    UserInfo login(String userName, String password);

}
