package com.wipe.healthy.web.dto;

import com.wipe.healthy.core.model.Account;
import org.springframework.beans.BeanUtils;

/**
 * 账户信息输入视图
 * User:Created by wei.li
 * Date: on 2016/3/2.
 * Time:11:37
 */
public class AccountInput {
    /**用户主键**/
    private Integer id;

    /**用户信息主键**/
    private Integer userId;

    /**用户登录名**/
    private String englishName;

    /**用户登陆密码**/
    private String password;

    /**用户授权信息**/
    private String authorithy;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAuthorithy() {
        return authorithy;
    }

    public void setAuthorithy(String authorithy) {
        this.authorithy = authorithy;
    }

    public Account convertToAccount(){
        Account account = new Account();
        BeanUtils.copyProperties(this,account);
        return account;
    }
}
