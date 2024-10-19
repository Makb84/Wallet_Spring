package com.wallet.controllers;

import com.wallet.models.Account;
import com.wallet.models.TransactionHistory;
import com.wallet.models.User;
import com.wallet.repository.AccountRepository;
import com.wallet.repository.TransactHistoryRepository;
import com.wallet.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {

    @Autowired
    private TransactHistoryRepository transactHistoryRepository;

    @Autowired
    private AccountRepository accountRepository;

    User user;

    @GetMapping("/dashboard")
    public ModelAndView getDashboard(HttpSession session) {
        ModelAndView getDashboardPage = new ModelAndView("dashboard");

        // Get the details of the logged-in user:
        user = (User) session.getAttribute("user");

        if (user == null) {
            // Redirect to login page if user is not found in session
            getDashboardPage.setViewName("redirect:/login");
            return getDashboardPage;
        }

        BigDecimal totalAccountsBalance = accountRepository.getTotalBalance(user.getUser_id());


        // Fetch the user's accounts using the correct repository method
        List<Account> userAccounts = accountRepository.getUserAccountsById(user.getUser_id());

        // Add the accounts to the model
        getDashboardPage.addObject("userAccounts", userAccounts);
        getDashboardPage.addObject("totalBalance", totalAccountsBalance);


        return getDashboardPage;
    }

    @GetMapping("/transact_history")
    public ModelAndView getTransactHistory(HttpSession session) {
        // Set View:
        ModelAndView getTransactHistoryPage = new ModelAndView("transactHistory");

        // Get Logged In User:
        user = (User) session.getAttribute("user");

        // Get Transaction History / Records:
        List<TransactionHistory> userTransactHistory = transactHistoryRepository.getTransactionRecordsById(user.getUser_id());

        // Add transaction history to the model
        getTransactHistoryPage.addObject("transact_history", userTransactHistory);

        return getTransactHistoryPage;
    }

        @Autowired
    private UserRepository userRepository; // Make sure you have this repository

    @GetMapping("/edit_profile")
    public ModelAndView editProfile(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("editProfile");
        
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            modelAndView.setViewName("redirect:/login"); // Redirect to login if no user is found
            return modelAndView;
        }
        
        modelAndView.addObject("user", user); // Pass user object to the JSP
        return modelAndView; // Return the name of the JSP page for editing profile
    }

    @PostMapping("/edit_profile")
    public ModelAndView updateProfile(@Valid User user, BindingResult result, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        if (result.hasErrors()) {
            modelAndView.setViewName("editProfile"); // Return to the edit page if validation fails
            modelAndView.addObject("user", user); // Add the user object to the model
            return modelAndView;
        }

        // Update user data in the repository
        userRepository.save(user); // Assuming save method updates the existing user
        
        session.setAttribute("user", user); // Update session with new user data
        modelAndView.setViewName("redirect:/app/dashboard"); // Redirect to dashboard after successful update
        return modelAndView;
    }

}
