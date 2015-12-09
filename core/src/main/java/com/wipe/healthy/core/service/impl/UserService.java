package com.wipe.healthy.core.service.impl;

import com.wipe.healthy.core.dao.read.UserReadDao;
import com.wipe.healthy.core.dao.write.UserWriteDao;
import com.wipe.healthy.core.model.User;
import com.wipe.healthy.core.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 用户信息服务实现
 * User:Created by wei.li
 * Date: on 2015/12/9.
 * Time:0:25
 */
@Service("userService")
public class UserService implements IUserService{

    @Resource
    UserWriteDao userWriteDao;

    @Resource
    UserReadDao userReadDao;

    /**
     * 新增用户信息
     * @param user 用户实体
     * @return 新增id
     *
     */
    @Override
    public Integer create(User user) {
        return this.userWriteDao.create(user);
    }

    /**
     * 通过id查找用户信息
     *
     * @param id 主键id
     * @return 用户信息
     */
    @Override
    public User findById(Integer id) {
        return this.userReadDao.findById(id);
    }
}
