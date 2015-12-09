package com.wipe.healthy.core.service;

import com.wipe.healthy.core.model.User;

/**
 * 用户信息服务
 * User:Created by wei.li
 * Date: on 2015/12/9.
 * Time:0:20
 */

public interface IUserService {

    /**
     * 新增用户信息
     * @param user 用户实体
     * @return 新增id
     *
     */
    Integer create(User user);

    /**
     * 通过id查找用户信息
     * @param id 主键id
     * @return 用户信息
     */
    User findById(Integer id);
}
