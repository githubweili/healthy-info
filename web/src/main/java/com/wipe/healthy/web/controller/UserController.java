package com.wipe.healthy.web.controller;

import com.wipe.healthy.core.model.User;
import com.wipe.healthy.service.biz.UserBiz;
import com.wipe.healthy.web.dto.AjaxResult;
import com.wipe.healthy.web.dto.UserInput;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

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
        return "../page/user/";
    }


    private final String createViewName = "list.jsp";
    /**
     * 用户信息新增
     * @param userInput 用户信息输入视图
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/create",method = RequestMethod.POST)
    public AjaxResult create(UserInput userInput){
        AjaxResult ajaxResult = new AjaxResult(true);
        userBiz.create(userInput.convertToUser(userInput));
        ajaxResult.setDescription("新增用户成功");
        return ajaxResult;
    }

    private final String listViewName = "list";
    /**
     * 用户列表查询
     * @return
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public ModelAndView list(){
        List<User> userList = userBiz.list();
        ModelAndView modelAndView = new ModelAndView(getRoutePath()+listViewName);
        modelAndView.addObject("userList",userList);
        return modelAndView;
    }
}
