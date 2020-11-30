package com.wolong.mapper;

import com.wolong.model.UserInfo;
import org.apache.ibatis.annotations.Param;

/**
 * @author 202007981
 * @Description
 * @date 2020/11/28 16:20
 */
public interface UserInfoMapper {

    UserInfo selectByName(String userName);

    UserInfo selectByNameAndPass(@Param("userName") String userName, @Param("password") String password);

}
