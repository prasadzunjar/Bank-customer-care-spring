package com.netcracker.controller;

import com.netcracker.dao.IUserDao;
import com.netcracker.dto.User;
import com.netcracker.dto.UserComplaint;
import com.netcracker.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@Controller

public class UserController {

    @Autowired
    private IUserService userService;
    @RequestMapping(value = "/index.html", method = RequestMethod.GET)
    public String getLoginPage(Model model, HttpSession session){
            model.addAttribute("user", new User());
//            model.addAttribute("prodList", userService.getUserByEmailAndPassword());
            return "home";
    }

    @RequestMapping(value = "/validateUser.html",method = RequestMethod.POST)
    public String validateUser(@ModelAttribute("user")User user1, Model model, HttpSession session){
        User user=userService.getUserByEmailAndPassword(user1);
        if(user!=null)
        {
            session.setAttribute("user",user.getEmail());
            model.addAttribute("user1",user1.getEmail());
            model.addAttribute("complaint",new UserComplaint());
            return "inbox";
        } else {
                model.addAttribute("error","Invalid Credentials");
             return "home";
        }
    }
    @RequestMapping(value = "/complaintForm.html",method = RequestMethod.POST)
    public String insertComplaintDetails(@ModelAttribute("complaint") UserComplaint userComplaint,Model model,HttpSession session)
    {
        if(session.getAttribute("user")==null){
            return "redirect:index.html";
        }
        if(userService.setComplaintDetails(userComplaint)){
           Integer complaintId=userService.getComplaintId(userComplaint);
           model.addAttribute("user",session.getAttribute("user"));
            model.addAttribute("complaint", userComplaint);
            model.addAttribute("comp_id", complaintId);
            return "complaint";
        }else{
            return "redirect:complaintForm.html";
        }
    }

    @RequestMapping("/inbox.html")
    public String goToInbox(Model model, HttpSession session){
        if(session.getAttribute("user")==null){
            return "redirect:index.html";
        }
        model.addAttribute("complaint",new UserComplaint());
        return "inbox";
    }
    @RequestMapping(value = "/status.html",method = RequestMethod.GET)
    public String checkStatus(@ModelAttribute("UserComplaint") UserComplaint userComplaint1, Model model, HttpSession session, HttpServletRequest request){
        if(session.getAttribute("user")==null){
            return "redirect:index.html";
        }
        if (userComplaint1.getComId()!=null) {
            System.out.println(userComplaint1);
            UserComplaint userComplaint = userService.getComplaintById(userComplaint1.getComId());
            model.addAttribute("complaint", userComplaint);
        }
        return "status";
    }


    @RequestMapping(value = "/status.html",method = RequestMethod.POST)
    public String checkStatus1(@ModelAttribute("UserComplaint") UserComplaint userComplaint1, Model model, HttpSession session, HttpServletRequest request){
        if(session.getAttribute("user")==null){
            return "redirect:index.html";
        }
        if (userComplaint1.getComId()!=null) {
            System.out.println(userComplaint1);
            UserComplaint userComplaint = userService.getComplaintById(userComplaint1.getComId());

            if(userComplaint==null){
                request.setAttribute("error","No complaint exists for this Complaint id!!");
                return "status";
            }
            model.addAttribute("complaint", userComplaint);
        }
        return "status";
    }
    @RequestMapping("/logout.html")
    public String logout(Model model,HttpSession session){
        session.invalidate();
        return "redirect:index.html";
    }

}
