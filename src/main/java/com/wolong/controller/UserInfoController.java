package com.wolong.controller;

import com.alibaba.fastjson.JSONArray;
import com.wolong.model.UserInfo;
import com.wolong.model.report.UserInfoCustomer;
import com.wolong.service.IUserInfoService;
import com.wolong.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 202007981
 * @Description
 * @date 2020/11/29 22:14
 */
@Controller
public class UserInfoController {
    @Autowired
    private IUserInfoService userInfoService;

    @RequestMapping(value = "wl/confirmUserName", method = RequestMethod.GET)
    @ResponseBody
    private String confirmUserName(String userName, HttpServletRequest request) {
        System.out.println("用户验证");
        int effectNum = userInfoService.confirmUserName(userName);
        if (effectNum > 0) {
            return "1";
        }
        return "0";
    }

    @RequestMapping(value = "wl/login", method = RequestMethod.POST)
    @ResponseBody
    private String login(@RequestBody String data, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("参数：" + data);
        UserInfoCustomer userInfoCustomer = JSONArray.parseObject(data, UserInfoCustomer.class);
        //假设密码错误(用户名已验证)
        int num = -1;
        String userName = userInfoCustomer.getUserName();
        String password = userInfoCustomer.getPassWord();
        System.out.println("json转换后的数据："+userName+"--"+password);
        //对密码加密
        String pass = MD5Util.MD5(password);
        System.out.println("加密密码:" + pass);
        //调用服务层方法，查询数据库;
        UserInfo userInfo = userInfoService.login(userName, pass);
        System.out.println(userInfo.toString());
        //用户名和密码正确
        if (userInfo != null) {
            num = 0;
            //当用户勾选记住密码时
            if ("1".equals(userInfoCustomer.getRemFlag())) {
                //保存登录信息
                String loginInfo = userName + password;
                //保存到Cookie中
                Cookie userCookie = new Cookie("loginInfo", loginInfo);
                //存活周期为一个月 30*24*60*60
                userCookie.setMaxAge(30 * 24 * 60 * 60);
                userCookie.setPath("/");
                response.addCookie(userCookie);
            }
            //把用户存储在session中
            request.getSession().setAttribute("userInfo", userInfo);
            //判断用户的类型
            System.out.println(userInfo.getModelType());
        }
        if (num == 0) {
            //成功
            return "0";
        } else {
            //密码错误
            return "-1";
        }
    }

    @RequestMapping("index")
    public String userLogin(HttpServletRequest request, String userName) {
        System.out.println("----ok-----" + userName);
        request.getSession().setAttribute("userName", userName);
        return "user_memu";
    }
}
