package com.example.th1_ss11.responsitory;

import com.example.th1_ss11.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class Repository {
    private static List<Customer> customers;
    static {
        customers = new ArrayList<>();
        customers.add(new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        customers.add(new Customer(2, "Bill", "bill@codegym.vn", "Danang"));
        customers.add( new Customer(3, "Alex", "alex@codegym.vn", "Saigon"));
        customers.add( new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        customers.add( new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
        customers.add( new Customer(6, "Rose", "rose@codegym.vn", "Newyork"));
    }
    public List<Customer> findAll(){
        return customers;
    }
    public void save(Customer customer){
        customers.add( customer);
    }
    public Customer findById(int id){
        return customers.get(id);
    }
    public void update(int id,Customer customer){
        customers.add(id, customer);
    }
    public boolean remove(int id){
       for(Customer customer : customers){
           if(customer.getId()==id){
               customers.remove(customer);
               return true;
           }
       }
       return false;
    }
}
