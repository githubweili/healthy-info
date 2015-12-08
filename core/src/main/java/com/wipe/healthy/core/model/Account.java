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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Account user = (Account) o;

        if (authorithy != null ? !authorithy.equals(user.authorithy) : user.authorithy != null) return false;
        if (id != null ? !id.equals(user.id) : user.id != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (userId != null ? !userId.equals(user.userId) : user.userId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (authorithy != null ? authorithy.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userId=" + userId +
                ", password='" + password + '\'' +
                ", authorithy='" + authorithy + '\'' +
                '}';
    }
}
