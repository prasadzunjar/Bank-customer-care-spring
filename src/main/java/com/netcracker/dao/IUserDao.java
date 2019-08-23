package com.netcracker.dao;

import com.netcracker.dto.User;
import com.netcracker.dto.UserComplaint;

public interface IUserDao {
    public User getUserByEmailAndPassword(User user);
    public Boolean setComplaintDetails(UserComplaint userComplaint);
    public Integer getComplaintId(UserComplaint userComplaint);
    public UserComplaint getComplaintById(Integer comp_id);
    }

