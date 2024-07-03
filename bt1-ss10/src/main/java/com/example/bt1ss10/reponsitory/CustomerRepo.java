package com.example.bt1ss10.reponsitory;

import com.example.bt1ss10.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepo  {
    private static List<Customer> customers ;
    static {
        customers= new ArrayList<>();
        customers.add(new Customer("Em gái 1","12/02/1999","Huế","image\\phuc.png"));
        customers.add(new Customer("Em gái 2","12/03/1999","Đà Nẵng","image\\phuc.png"));
        customers.add(new Customer("Em gái 2","12/04/1999","Quảng Nam","image\\phuc.png"));

    }



    public List<Customer> getCustomers() {
        return customers;
    }
}
