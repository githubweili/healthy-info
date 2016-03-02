package com.wipe.healthy.web.controller;

import com.wipe.healthy.service.biz.AccountBiz;
import com.wipe.healthy.web.dto.AccountInput;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.HashMap;

/**
 * 账号控制器
 * User:Created by wei.li
 * Date: on 2016/3/2.
 * Time:11:39
 */

@Controller
@RequestMapping(value = "/account")
public class AccountController {

    @Resource
    AccountBiz accountBiz;

    public String getRoutePath() {
        return "/account/";
    }


    private final String createViewName = "list.jsp";
    /**
     * 账号新增
     * @param accountInput 账号输入视图
     * @return
     */
    @RequestMapping(value = "/create")
    public String create(AccountInput accountInput){
        accountBiz.create(accountInput.convertToAccount());
        return getRoutePath()+createViewName;
    }

    private final String updateViewName = "list.jsp";
    /**
     * 更新账号信息
     * @param accountInput
     * @return
     */
    @RequestMapping(value = "/update")
    public String update(AccountInput accountInput){
        accountBiz.update(accountInput.convertToAccount());
        return getRoutePath()+updateViewName;
    }

    private final String deleteViewName = "list.jsp";
    /**
     * 删除账户信息
     * @param id 主键
     * @return
     */
    @RequestMapping(value = "/delete")
    public String delete(Integer id){
        accountBiz.delete(id);
        return getRoutePath()+deleteViewName;
    }

    private final String listViewName = "list.jsp";
    /**
     * 查询账户列表
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(){
        accountBiz.list(new HashMap<String, Object>());
        return getRoutePath()+listViewName;
    }
}
