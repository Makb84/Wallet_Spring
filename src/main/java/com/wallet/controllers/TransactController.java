package com.wallet.controllers;

import com.wallet.models.User;
import com.wallet.repository.AccountRepository;
// import com.wallet.repository.PaymentRepository;
import com.wallet.repository.TransactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/transact")
public class TransactController {

    @Autowired
    private AccountRepository accountRepository;

    // @Autowired
    // private PaymentRepository paymentRepository;
    @Autowired
    private TransactRepository transactRepository;

    User user;
    double currentBalance;
    double newBalance;
    LocalDateTime currentDateTime = LocalDateTime.now();

    @PostMapping("/deposit")
    public String deposit(@RequestParam("deposit_amount")String depositAmount,
                          @RequestParam("account_id") String accountID,
                          HttpSession session,
                          RedirectAttributes redirectAttributes){

        // TODO: CHECK FOR EMPTY STRINGS:
        if(depositAmount.isEmpty() || accountID.isEmpty()){
            redirectAttributes.addFlashAttribute("error", "لطفا مقادیر را به درستی و کامل وارد کنید");
            return "redirect:/app/dashboard";
        }
        // TODO GET LOGGED IN USER:
        user = (User)session.getAttribute("user");

        // TODO: GET CURRENT ACCOUNT BALANCE:
        int acc_id = Integer.parseInt(accountID);

        double depositAmountValue = Double.parseDouble(depositAmount);

        //TODO: CHECK IF DEPOSIT AMOUNT IS 0 (ZERO):
        if(depositAmountValue == 0){
            redirectAttributes.addFlashAttribute("error", "مقدار واریز باید بزرگتر از ۰ باشد");
            return "redirect:/app/dashboard";
        }

        // TODO: UPDATE BALANCE:
        currentBalance = accountRepository.getAccountBalance(user.getUser_id(), acc_id);

        newBalance = currentBalance + depositAmountValue;

        // Update Account:
        accountRepository.changeAccountBalanceById(newBalance, acc_id);

        // Log Successful Transaction:
        transactRepository.logTransaction(acc_id, "deposit", depositAmountValue, "online", "success", "Deposit Transaction Successful",currentDateTime);

        redirectAttributes.addFlashAttribute("success", "واریز با موفقیت انجام شد");
        return "redirect:/app/dashboard";
    }
    // End Of Deposits.

    @PostMapping("/transfer")
    public String transfer(@RequestParam("transfer_from") String transfer_from,
                           @RequestParam("transfer_to") String transfer_to,
                           @RequestParam("transfer_amount")String transfer_amount,
                           HttpSession session,
                           RedirectAttributes redirectAttributes){
        // Init Error Message Value:
        String errorMessage;

        // TODO: CHECK FOR EMPTY FIELDS:
        if(transfer_from.isEmpty() || transfer_to.isEmpty() || transfer_amount.isEmpty()){
             errorMessage = "مقادیر ورودی نباید خالی باشد!";
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        // TODO: CONVERT VARIABLES:
        int transferFromId = Integer.parseInt(transfer_from);
        int transferToId = Integer.parseInt(transfer_to);
        double transferAmount = Double.parseDouble(transfer_amount);

        // TODO: CHECK IF TRANSFERRING INTO THE SAME ACCOUNT:
        if(transferFromId == transferToId){
            errorMessage = "جهت انتقال موفق لطفا حساب مبدا و مقصد متفاوت باشد.";
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        // TODO: CHECK FOR 0 (ZERO) VALUES:
        if(transferAmount == 0){
            errorMessage = "مقدار انتقال باید بزرگتر از صفر باشد. ";
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        // TODO: GET LOGGED IN USER:
        user = (User)session.getAttribute("user");

        // TODO: GET CURRENT BALANCE:
        double currentBalanceOfAccountTransferringFrom  = accountRepository.getAccountBalance(user.getUser_id(), transferFromId);

        // TODO: CHECK IF TRANSFER AMOUNT IS MORE THAN CURRENT BALANCE:
        if(currentBalanceOfAccountTransferringFrom < transferAmount){
            errorMessage = "مقدار انتقالی بیشتر از موجودی است.";
            // Log Failed Transaction:
            transactRepository.logTransaction(transferFromId, "Transfer", transferAmount, "online", "failed", "Insufficient Funds", currentDateTime);
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        double  currentBalanceOfAccountTransferringTo = accountRepository.getAccountBalance(user.getUser_id(), transferToId);

        // TODO: SET NEW BALANCE:
        double newBalanceOfAccountTransferringFrom = currentBalanceOfAccountTransferringFrom - transferAmount;

        double newBalanceOfAccountTransferringTo = currentBalanceOfAccountTransferringTo + transferAmount;

        // Changed The Balance Of the Account Transferring From:
        accountRepository.changeAccountBalanceById( newBalanceOfAccountTransferringFrom, transferFromId);

        // Changed The Balance Of the Account Transferring To:
        accountRepository.changeAccountBalanceById(newBalanceOfAccountTransferringTo, transferToId);

        // Log Successful Transaction:
        transactRepository.logTransaction(transferFromId, "Transfer", transferAmount, "online", "success", "Transfer Transaction Successful",currentDateTime);

        String successMessage = "انتقال با موفقیت انجام شد";
        redirectAttributes.addFlashAttribute("success", successMessage);
        return "redirect:/app/dashboard";
    }
    // End Of Transfer Method.


    private static final double MINIMUM_BALANCE = 10000;
    @PostMapping("/withdraw")
    public String withdraw(@RequestParam("withdrawal_amount")String withdrawalAmount,
                           @RequestParam("account_id")String accountID,
                           HttpSession session,
                           RedirectAttributes redirectAttributes){

        String errorMessage;
        String successMessage;

        // TODO: CHECK FOR EMPTY VALUES:
        if(withdrawalAmount.isEmpty() || accountID.isEmpty()){
            errorMessage = "مقدار برداشت خالی است!";
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }
        // TODO: CONVERT VARIABLES:
        double withdrawal_amount = Double.parseDouble(withdrawalAmount);
        int account_id = Integer.parseInt(accountID);

        // TODO: VALIDATE WITHDRAWAL AMOUNT:
        // if (withdrawal_amount < 100000 || withdrawal_amount > 10000000) {
        //     errorMessage = "مقدار برداشت باید بین ۱۰ تا ۱۰۰ باشد!";
        //     redirectAttributes.addFlashAttribute("error", errorMessage);
        //     return "redirect:/app/dashboard";
        // }
 
        // TODO: CHECK FOR 0 (ZERO) VALUES:
        if (withdrawal_amount == 0){
            errorMessage = "مقدار برداشتی باید بیشتر از صفر باشد.";
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        // TODO: GET LOGGED IN USER:
        user = (User) session.getAttribute("user");
        
        // TODO: GET CURRENT BALANCE:
        currentBalance = accountRepository.getAccountBalance(user.getUser_id(), account_id);
        
        // TODO: CHECK IF BALANCE AFTER WITHDRAWAL WOULD BE LESS THAN MINIMUM_BALANCE
        if (currentBalance - withdrawal_amount < MINIMUM_BALANCE) {
            errorMessage = "موجودی حساب پس از برداشت نباید کمتر از ۱۰,۰۰۰ باشد!";
            // Log Failed Transaction:
            transactRepository.logTransaction(account_id, "Withdrawal", withdrawal_amount, "online", "failed", "Insufficient Funds: Below Minimum Balance", currentDateTime);
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        // TODO: CHECK IF TRANSFER AMOUNT IS MORE THAN CURRENT BALANCE:
        if(currentBalance < withdrawal_amount){
            errorMessage = "مقدار برداشتی بیشتر از موجودی است!";
            // Log Failed Transaction:
            transactRepository.logTransaction(account_id, "Withdrawal", withdrawal_amount, "online", "failed", "Insufficient Funds", currentDateTime);
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        // TODO: SET NEW BALANCE:
        newBalance = currentBalance - withdrawal_amount;

        // TODO: UPDATE ACCOUNT BALANCE:
        accountRepository.changeAccountBalanceById(newBalance, account_id);

        // Log Successful Transaction:
        transactRepository.logTransaction(account_id, "Withdrawal", withdrawal_amount, "online", "success", "Withdrawal Transaction Successful",currentDateTime);

        successMessage = "برداشت با موفقیت انجام شد";
        redirectAttributes.addFlashAttribute("success", successMessage);
        return "redirect:/app/dashboard";
    }
    // End Of Withdrawal Method.

}
