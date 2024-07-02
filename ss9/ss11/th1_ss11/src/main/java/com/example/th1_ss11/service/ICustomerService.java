package com.example.th1_ss11.service;

import com.example.th1_ss11.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    void update(int id, Customer customer);
    boolean remove(int id);
}
