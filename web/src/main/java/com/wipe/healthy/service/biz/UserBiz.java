package com.wipe.healthy.service.biz;

import com.wipe.healthy.core.model.User;
import com.wipe.healthy.core.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 *用户信息业务服务层
 * User:Created by wei.li
 * Date: on 2016/3/1.
 * Time:21:17
 */
@Service
public class UserBiz {
    @Resource
    IUserService userService;

    /**
     * 用户信息新增
     * @param user 用户信息
     * @return
     */
    public Integer create(User user){
        return userService.create(user);
    }
}
