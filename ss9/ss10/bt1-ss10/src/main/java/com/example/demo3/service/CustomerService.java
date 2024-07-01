package com.example.demo3.service;

import com.example.demo3.model.Customer;
import com.example.demo3.repository.CustomerRepo;

import java.util.List;

public class CustomerService implements ICustomerService {
    CustomerRepo repo = new CustomerRepo();
    @Override
    public List<Customer> getCustomers() {
        return repo.getCustomer();
    }
}
