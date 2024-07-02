package com.example.bt11_ss12.service;

import com.example.bt11_ss12.model.User;

import java.util.List;

public interface IService {
    List<User> findAll();

    void saveUser(User user);
    User findUserById(int id);
    boolean deleteUser(int id);
    List<User> findUserByName(String country);
    boolean updateUser(User user);
    List<User> sortedName();

}
