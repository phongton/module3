package com.example.bt11_ss12.service.impl;

import com.example.bt11_ss12.model.User;
import com.example.bt11_ss12.reponsitory.UserRepository;
import com.example.bt11_ss12.service.IService;

import java.util.List;

public class Service implements IService {
    private UserRepository repo = new UserRepository();
    @Override
    public List<User> findAll() {
        return repo.findAll() ;
    }

    @Override
    public void saveUser(User user) {
        repo.saveUser(user);
    }

    @Override
    public User findUserById(int id) {
        return repo.findById(id);
    }

    @Override
    public boolean deleteUser(int id) {
        return repo.deleteUser(id);
    }

    @Override
    public List<User> findUserByName(String country) {
        return repo.findByName(country);
    }

    @Override
    public boolean updateUser(User user) {
        return repo.updateUser(user);
    }

    @Override
    public List<User> sortedName() {
        return repo.sortedName();
    }
}
