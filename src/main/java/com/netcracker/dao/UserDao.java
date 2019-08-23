package com.netcracker.dao;
import com.netcracker.dto.User;
import com.netcracker.dto.UserComplaint;
import com.netcracker.utility.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.Arrays;

@Repository
public class UserDao implements IUserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;


    RowMapper<User> userRowMapper=(resultSet, rowNumber)->{
        User user=new User();
        user.setUserId(resultSet.getInt("user_id"));
        user.setEmail(resultSet.getString("email"));
        user.setPassword(resultSet.getString("password"));
        return user;
    };
    RowMapper<UserComplaint> userComplaintRowMapper=(resultSet, rowNumber)->{
        UserComplaint userComplaint=new UserComplaint();
        userComplaint.setAccountId(resultSet.getString("account_id"));
        userComplaint.setBranchCode(resultSet.getString("branchcode"));
        userComplaint.setEmail(resultSet.getString("email"));
        userComplaint.setCategory(resultSet.getString("complaint_category"));
        userComplaint.setDescription(resultSet.getString("description"));
        userComplaint.setPriority(resultSet.getString("priority"));
        userComplaint.setStatus(resultSet.getString("status"));
        userComplaint.setComId(resultSet.getInt("complaint_id"));
        return userComplaint;
    };
    @Override
    public  User getUserByEmailAndPassword(User user)
    {
        try {
            Object[] params={user.getEmail(),user.getPassword()};
          //  System.out.println((jdbcTemplate.queryForObject(Constants.getUserByEmailAndPassword,params,productRowMapper)).toString());
            return jdbcTemplate.queryForObject(Constants.getUserByEmailAndPassword,params,userRowMapper);
        }catch (EmptyResultDataAccessException em){
            return null;
        }
    }
        @Override
    public Boolean setComplaintDetails(UserComplaint userComplaint) {
        int flag;
        Object[] params = {userComplaint.getAccountId(), userComplaint.getBranchCode(), userComplaint.getEmail(), userComplaint.getCategory(), userComplaint.getDescription()};
            params = Arrays.copyOf(params, params.length + 2); //create new array from old array and allocate one more element
            params[params.length - 2] = 4;
        if (userComplaint.getCategory().equals("Internet Banking")) {
            params[params.length - 2] = "high";
        }else if(userComplaint.getCategory().equals("General Banking")) {
            params[params.length - 2]="medium";
        }
        else params[params.length - 2]="low";
            params[params.length - 1]="open";
        flag=jdbcTemplate.update(Constants.setComplaintDetails,params);
        if(flag!=0)
        {
            return true;
        }
        else return false;
    }

    @Override
    public Integer getComplaintId(UserComplaint userComplaint){
        Object[] params={userComplaint.getEmail(),userComplaint.getDescription()};
        UserComplaint temp=  jdbcTemplate.queryForObject(Constants.getComplaintId,params,userComplaintRowMapper);
        return  temp.getComId();
    }
    @Override
    public UserComplaint getComplaintById(Integer comp_id){
        Object[] params={comp_id};
        UserComplaint temp=null;
        try {
             temp = jdbcTemplate.queryForObject(Constants.getComplaintById, params, userComplaintRowMapper);
        }catch (Exception e){
            e.printStackTrace();
        }
        return  temp;
    }

}
