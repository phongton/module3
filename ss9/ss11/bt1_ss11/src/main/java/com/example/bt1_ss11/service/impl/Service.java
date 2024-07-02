package com.example.bt1_ss11.service.impl;

import com.example.bt1_ss11.model.Product;
import com.example.bt1_ss11.repository.CustomerRepo;

import java.util.List;

public class Service implements IService{
    CustomerRepo repo=new CustomerRepo();
    @Override
    public List<Product> findAllProduct() {
        return repo.findAllProduct();
    }

    @Override
    public void addProduct(Product product) {

    }

    @Override
    public void updateProduct(int id,String name,String desc,int price) {
        repo.updateProduct(id,name,desc,price);
    }

    @Override
    public boolean deleteProduct(int id) {
        return repo.deleteProduct(id);
    }

    @Override
    public void saveProduct(Product product) {
    repo.saveProduct(product);
    }

    @Override
    public List<Product> findByName(String name) {
        return repo.findProductByName(name);
    }

    @Override
    public Product findById(int id) {
        return repo.findById(id);
    }
}
