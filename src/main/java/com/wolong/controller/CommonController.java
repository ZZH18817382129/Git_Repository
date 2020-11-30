package com.wolong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 202007981
 * @Description
 * @date 2020/11/28 15:58
 */
@Controller
@RequestMapping("wl")
public class CommonController {

    @RequestMapping("manager/login")
    public String managerLogin() {
        return "manager_login";
    }
}
