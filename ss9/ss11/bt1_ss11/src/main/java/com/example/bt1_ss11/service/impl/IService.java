package com.example.bt1_ss11.service.impl;

import com.example.bt1_ss11.model.Product;

import java.util.List;

public interface IService {
    List<Product> findAllProduct();
    boolean updateProduct(int id,String name,String desc,int price);
    boolean deleteProduct(int id);
    void saveProduct(Product product);
    List<Product>  findByName(String name);
    Product findById(int id);
}
