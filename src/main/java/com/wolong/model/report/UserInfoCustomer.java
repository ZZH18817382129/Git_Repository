package com.wolong.model.report;

import com.wolong.model.UserInfo;

/**
 * @author 202007981
 * @Description
 * @date 2020/11/29 22:18
 */
public class UserInfoCustomer extends UserInfo {
    private String remFlag;

    public String getRemFlag() {
        return remFlag;
    }

    public void setRemFlag(String remFlag) {
        this.remFlag = remFlag;
    }

    @Override
    public String toString() {
        return "UserCustomer{" +
                "remFlag='" + remFlag + '\'' +
                '}';
    }
}
