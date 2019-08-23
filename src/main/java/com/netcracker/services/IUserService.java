package com.netcracker.services;

import com.netcracker.dto.User;
import com.netcracker.dto.UserComplaint;

public interface IUserService {
    User getUserByEmailAndPassword(User user);
    public Boolean setComplaintDetails(UserComplaint userComplaint);
    public Integer getComplaintId(UserComplaint userComplaint);
    public UserComplaint getComplaintById(Integer comp_id);
}
