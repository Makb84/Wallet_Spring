package com.wallet.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @GetMapping("/")
    public ModelAndView getIndex(){
        ModelAndView getIndexPage = new ModelAndView("index");
        getIndexPage.addObject("pageTitle", "Home");
        System.out.println("Index Controller");
        return getIndexPage;
    }

    @GetMapping("/login")
    public ModelAndView getLogin(){
        ModelAndView getLoginPage = new ModelAndView("login");
        getLoginPage.addObject("pageTitle", "Login");
        System.out.println("Login Controller");
        return getLoginPage;
    }

    @GetMapping("/error")
    public ModelAndView getError(){
        ModelAndView getErrorPage = new ModelAndView("error");
        getErrorPage.addObject("pageTitle", "Error");
        System.out.println("Error Controller");
        return getErrorPage;
    }

    @GetMapping("/verify")
    public ModelAndView getVerify(){
        ModelAndView getVerifyPage = new ModelAndView("login");
        getVerifyPage.addObject("pageTitle", "Verify");
        System.out.println("Error Controller");
        return getVerifyPage;
    }
    
    
}
