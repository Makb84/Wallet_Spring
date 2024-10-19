package com.wallet.controllers;

import com.wallet.models.Account;
import com.wallet.models.TransactionHistory;
import com.wallet.models.User;
import com.wallet.repository.AccountRepository;
import com.wallet.repository.TransactHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

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

}
