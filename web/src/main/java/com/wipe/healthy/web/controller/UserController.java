package com.wipe.healthy.web.controller;

import com.wipe.healthy.service.biz.UserBiz;
import com.wipe.healthy.web.dto.UserInput;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * 用户信息控制器
 * User:Created by wei.li
 * Date: on 2016/3/1.
 * Time:21:03
 */

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Resource
    UserBiz userBiz;


    public String getRoutePath() {
        return "/user/";
    }
    /**
     * 用户信息新增
     * @param userInput 用户信息输入视图
     * @return
     */

    private final String createViewName = "list.jsp";
    @RequestMapping(value = "/create")
    public String create(UserInput userInput){
        userBiz.create(userInput.convertToUser(userInput));
        return getRoutePath()+createViewName;
    }
}
