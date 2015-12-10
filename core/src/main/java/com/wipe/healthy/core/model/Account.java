package com.wipe.healthy.core.model;


/**
 * 数据持久层账号实体
 * User:Created by wei.li
 * Date: on 2015/12/8.
 * Time:19:46
 */

public class Account {

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

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Account account = (Account) o;

        if (authorithy != null ? !authorithy.equals(account.authorithy) : account.authorithy != null) return false;
        if (englishName != null ? !englishName.equals(account.englishName) : account.englishName != null) return false;
        if (id != null ? !id.equals(account.id) : account.id != null) return false;
        if (password != null ? !password.equals(account.password) : account.password != null) return false;
        if (userId != null ? !userId.equals(account.userId) : account.userId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (englishName != null ? englishName.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (authorithy != null ? authorithy.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", userId=" + userId +
                ", englishName='" + englishName + '\'' +
                ", password='" + password + '\'' +
                ", authorithy='" + authorithy + '\'' +
                '}';
    }
}
