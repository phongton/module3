package com.example.bt1ss10.service;

import com.example.bt1ss10.model.Customer;
import com.example.bt1ss10.reponsitory.CustomerRepo;

import java.util.List;

public class CustomerService implements ICustomerService {
    CustomerRepo repo = new CustomerRepo() ;

    @Override
    public List<Customer> getCustomers() {
        return repo.getCustomers();
    }
}
