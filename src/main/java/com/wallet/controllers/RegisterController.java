package com.wallet.controllers;

import com.wallet.models.User;
import com.wallet.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.validation.Valid;

@Controller
public class RegisterController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/register")
    public ModelAndView getRegister() {
        ModelAndView getRegisterPage = new ModelAndView("register");
        System.out.println("In Register Page Controller");
        getRegisterPage.addObject("PageTitle", "Register");
        return getRegisterPage;
    }

    @PostMapping("/register")
    public ModelAndView register(@Valid @ModelAttribute("registerUser") User user,
                                 BindingResult result,
                                 @RequestParam("first_name") String first_name,
                                 @RequestParam("last_name") String last_name,
                                 @RequestParam("email") String email,
                                 @RequestParam("password") String password,
                                 @RequestParam("confirm_password") String confirm_password) {

        ModelAndView registrationPage = new ModelAndView("register");

        // Check for errors:
        if (result.hasErrors() && confirm_password.isEmpty()) {
            registrationPage.addObject("confirm_pass", "The confirm field is required");
            return registrationPage;
        }

        // Check if passwords match:
        if (!password.equals(confirm_password)) {
            registrationPage.addObject("passwordMisMatch", "Passwords do not match");
            return registrationPage;
        }

        // Hash the password:
        String hashed_password = BCrypt.hashpw(password, BCrypt.gensalt());

        // Register the user (no token or code needed):
        userRepository.registerUser(first_name, last_name, email, hashed_password); // Call the updated method

        // Return success message:
        String successMessage = "حساب با موفقیت ثبت شد.";
        registrationPage.addObject("success", successMessage);
        return registrationPage;
    }
}
