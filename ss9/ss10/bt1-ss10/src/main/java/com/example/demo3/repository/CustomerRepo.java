package com.example.demo3.repository;

import com.example.demo3.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepo {
    private static List<Customer> customers;
    static {
        customers = new ArrayList<>();

        customers.add(new Customer("Em gái 1","12/02/1999","Huế","https://duhocsunny.edu.vn/wp-content/uploads/2023/02/Anh-gai-xinh-Han-Quoc-Ji-Seong.jpg"));
        customers.add(new Customer("Em gái 2","12/03/1999","Đà Nẵng","https://duhocsunny.edu.vn/wp-content/uploads/2023/02/Anh-gai-xinh-Han-Quoc-Ji-Seong.jpg"));
        customers.add(new Customer("Em gái 2","12/04/1999","Quảng Nam","https://duhocsunny.edu.vn/wp-content/uploads/2023/02/Anh-gai-xinh-Han-Quoc-Ji-Seong.jpg"));
    }
    public List<Customer> getCustomer() {
        return customers;
    }
}
