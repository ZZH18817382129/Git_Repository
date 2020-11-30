package com.wolong.service.impl;

import com.wolong.mapper.UserInfoMapper;
import com.wolong.model.UserInfo;
import com.wolong.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 202007981
 * @Description
 * @date 2020/11/30 14:24
 */
@Service
public class UserInfoServiceImpl implements IUserInfoService {
    @Autowired
    private UserInfoMapper userInfoMapper;

    public int confirmUserName(String userName) {
        UserInfo userInfo = userInfoMapper.selectByName(userName);
        if (userInfo == null) {
            return 0;
        }
        return 1;
    }

    public UserInfo login(String userName, String password) {
        return userInfoMapper.selectByNameAndPass(userName, password);
    }
}
