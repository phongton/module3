package com.example.th1_ss11.service;

import com.example.th1_ss11.model.Customer;
import com.example.th1_ss11.responsitory.Repository;

import java.util.List;

public class Service implements ICustomerService {
    private Repository repo = new Repository();

    @Override
    public List<Customer> findAll() {
        return repo.findAll();
    }

    @Override
    public void save(Customer customer) {
        repo.save(customer);
    }

    @Override
    public Customer findById(int id) {
        return repo.findById(id);
    }

    @Override
    public void update(int id, Customer customer) {
        repo.update(id, customer);
    }

    @Override
    public boolean remove(int id) {
        return repo.remove(id);
   }
}
