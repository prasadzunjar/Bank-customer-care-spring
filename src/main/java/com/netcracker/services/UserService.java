package com.netcracker.services;

import com.netcracker.dao.UserDao;
import com.netcracker.dto.User;
import com.netcracker.dto.UserComplaint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements IUserService {
    @Autowired
    UserDao userDao;
    @Override
    public User getUserByEmailAndPassword(User user)
    {
        return userDao.getUserByEmailAndPassword(user);
    }
    @Override
    public Boolean setComplaintDetails(UserComplaint userComplaint){
        return userDao.setComplaintDetails(userComplaint);
    }
    @Override
    public Integer getComplaintId(UserComplaint userComplaint){
        return userDao.getComplaintId(userComplaint);
    }
    @Override
    public UserComplaint getComplaintById(Integer comp_id){

        return userDao.getComplaintById(comp_id);
    }
}


