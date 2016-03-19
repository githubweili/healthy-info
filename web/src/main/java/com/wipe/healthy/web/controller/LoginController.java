package com.wipe.healthy.web.controller;

import com.google.common.base.Strings;
import com.wipe.healthy.service.biz.AccountBiz;
import com.wipe.healthy.web.dto.AccountInput;
import com.wipe.healthy.web.dto.AjaxResult;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 登陆控制器
 * User:Created by wei.li
 * Date: on 2016/3/11.
 * Time:14:06
 */
public class LoginController {

    @Resource
    AccountBiz accountBiz;
    /**
     * 登陆验证控制器
     * @param accountInput 账户信息
     * @param request 请求参数
     * @return 登陆结果
     */
    public AjaxResult login(AccountInput accountInput,
                            HttpServletRequest request){
        AjaxResult ajaxResult = new AjaxResult(false);
        if (Strings.isNullOrEmpty(accountInput.getEnglishName())){
            ajaxResult.setDescription("请输入登陆账号");
        }
        else if (Strings.isNullOrEmpty(accountInput.getPassword())){
            ajaxResult.setDescription("请输入密码");
        }
        else if (Strings.isNullOrEmpty(accountInput.getVerification())){
            ajaxResult.setDescription("请输入验证码");
        }

        //比较登陆密码
        boolean result = accountBiz.login(accountInput.convertToAccount());
        if (!result){
            ajaxResult.setDescription("账号密码不匹配");
        }
        //判断验证码
        HttpSession session = request.getSession();
        String verification = (String)session.getAttribute("captchaToken");
        if (!verification.equalsIgnoreCase(accountInput.getVerification())){
            ajaxResult.setDescription("验证码错误");
        }else {
            accountBiz.loginWrite(accountInput.convertToAccount(),request);
            ajaxResult.setSuccess(true);
        }
        return ajaxResult;
    }
}
