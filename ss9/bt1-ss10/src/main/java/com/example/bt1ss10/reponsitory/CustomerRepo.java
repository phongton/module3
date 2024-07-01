package com.example.bt1ss10.reponsitory;

import com.example.bt1ss10.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustormerRepo implements IRepoCustomer {
    private static List<Customer> customers = new ArrayList<>();
    static {
        customers.add(new Customer("Mai Văn Hoàn","12/02/1999","Huế","https://duhocsunny.edu.vn/wp-content/uploads/2023/02/Anh-gai-xinh-Han-Quoc-Ji-Seong.jpg"));
        customers.add(new Customer("Mai Văn Hoàn","12/02/1999","Huế","https://i.pinimg.com/736x/89/11/d4/8911d45fd29b3e7a36b937ef8df3f47a.jpg"));
        customers.add(new Customer("Mai Văn Hoàn","12/02/1999","Huế","https://likevape.vn/wp-content/uploads/2023/08/21205817-hinh-anh-gai-xinh-11.jpg"));

    }


    @Override
    public List<Customer> getCustomers() {
        return List.of();
    }
}
