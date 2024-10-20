package com.wallet.repository;

import com.wallet.models.User;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {

    @Query(value = "SELECT email FROM users WHERE email = :email", nativeQuery = true)
    String getUserEmail(@Param("email") String email);

    @Query(value = "SELECT password FROM users WHERE email = :email", nativeQuery = true)
    String getUserPassword(@Param("email") String email);

    @Query(value = "SELECT verified FROM users WHERE email = :email", nativeQuery = true)
    int isVerified(@Param("email") String email);

    @Query(value = "SELECT * FROM users WHERE email = :email", nativeQuery = true)
    User getUserDetails(@Param("email") String email);

    @Modifying
    @Query(value = "INSERT INTO users (first_name, last_name, email, password) VALUES " +
            "(:first_name, :last_name, :email, :password)", nativeQuery = true) // Removed trailing comma
    @Transactional
    void registerUser(@Param("first_name") String first_name,
                      @Param("last_name") String last_name,
                      @Param("email") String email,
                      @Param("password") String password);

        @Modifying
        @Query(value = "UPDATE users SET first_name = :first_name, last_name = :last_name, email = :email, phone_number = :phone_number, date_of_birth = :date_of_birth, gender = :gender WHERE user_id = :user_id", nativeQuery = true)
        @Transactional // Make sure to include @Transactional here as well
        void updateUser(@Param("user_id") int userId,
                        @Param("first_name") String firstName,
                        @Param("last_name") String lastName,
                        @Param("email") String email,
                        @Param("phone_number") String phoneNumber,
                        @Param("date_of_birth") String dateOfBirth,
                        @Param("gender") String gender);
                      

    @Modifying
    @Query(value = "UPDATE users SET token=null, code=null, verified=1, verified_at=NOW(), updated_at=NOW() WHERE " +
            "token= :token AND code= :code", nativeQuery = true)
    @Transactional
    void verifyAccount(@Param("token") String token, @Param("code") String code);

    @Query(value = "SELECT token FROM users WHERE token = :token", nativeQuery = true)
    String checkToken(@Param("token") String token);
}
