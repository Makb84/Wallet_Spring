package com.wallet.models;

import java.time.LocalDate;
import java.time.LocalDateTime;

import io.micrometer.common.lang.NonNull;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;


@Entity
public class User {

    @Id
    private int user_id;

    // @NotEmpty
    private String national_code;
    
    @NotEmpty(message = "the firstname field cannot be empty")
    @Size(min=3)
    private String first_name;

    @NotEmpty
    private String last_name;

    // @NotEmpty
    private String date_of_birth;

    // @NotEmpty
    private String phone_number;

    // @NotEmpty
    private String gender;

    // @NotEmpty
    private int military_card;

    @NotEmpty
    @Email
    @Pattern(regexp = "([a-zA-Z0-9]+(?:[._+-][a-zA-Z0-9]+)*)@([a-zA-Z0-9]+(?:[.-][a-zA-Z0-9]+)*[.][a-zA-Z]{2,})", message = "Please Enter a Valid Email")
    private String email;

    @NotEmpty
    @NonNull
    private String password;

    @Transient
    private String confirm_password;

    public String getConfirm_password() {
        return confirm_password;
    }
    public void setConfirm_password(String confirm_password) {
        this.confirm_password = confirm_password;
    }
    private String token;
    private String code;
    private int verified;
    private LocalDate verified_at;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public String getNational_code() {
        return national_code;
    }
    public void setNational_code(String national_code) {
        this.national_code = national_code;
    }
    public String getFirst_name() {
        return first_name;
    }
    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }
    public String getLast_name() {
        return last_name;
    }
    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }
    public String getDate_of_birth() {
        return date_of_birth;
    }
    public void setDate_of_birth(String date_of_birth) {
        this.date_of_birth = date_of_birth;
    }
    public String getPhone_number() {
        return phone_number;
    }
    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public int getMilitary_card() {
        return military_card;
    }
    public void setMilitary_card(int military_card) {
        this.military_card = military_card;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getToken() {
        return token;
    }
    public void setToken(String token) {
        this.token = token;
    }
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public int getVerified() {
        return verified;
    }
    public void setVerified(int verified) {
        this.verified = verified;
    }
    public LocalDate getVerified_at() {
        return verified_at;
    }
    public void setVerified_at(LocalDate verified_at) {
        this.verified_at = verified_at;
    }
    public LocalDateTime getCreated_at() {
        return created_at;
    }
    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }
    public LocalDateTime getUpdated_at() {
        return updated_at;
    }
    public void setUpdated_at(LocalDateTime updated_at) {
        this.updated_at = updated_at;
    }


    
}
