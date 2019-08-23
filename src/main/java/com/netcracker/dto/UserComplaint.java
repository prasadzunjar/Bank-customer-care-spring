package com.netcracker.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class UserComplaint {
    private String accountId;
    private String branchCode;
    private String email;
    private String category;
    private String description;
    private String priority;
    private String status;
    private Integer comId;
}