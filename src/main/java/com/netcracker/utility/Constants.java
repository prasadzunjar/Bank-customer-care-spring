package com.netcracker.utility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Constants {
    public static String getUserByEmailAndPassword="select * from nc_users where email=? and password=?";

    public static final String setComplaintDetails = "insert into complaints(account_id,branchcode,email,complaint_category,description,priority,status,complaint_id) " +
            "values(?,?,?,?,?,?,?,com_seq.nextval)";
    public static final String getComplaintStatus="select complaint_id,description,status from complaints where complaint_id=?";
    public  static final String getComplaintId="select * from complaints where email=? and description=?";

    public static final String getComplaintById="select * from complaints where complaint_id=?";
}
