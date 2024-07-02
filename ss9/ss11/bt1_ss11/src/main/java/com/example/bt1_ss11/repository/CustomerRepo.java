package com.example.bt1_ss11.repository;

import com.example.bt1_ss11.model.Product;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepo {
   private static List<Product> products;
    static {
        products=new ArrayList<>();
        products.add(new Product(1,"SamSung","Điện thoại",20000000));
        products.add(new Product(2,"IPhone","Điện thoại",30000000));
        products.add(new Product(3,"MacBook","Máy tính",40000000));
    }
    public List<Product> findAllProduct() {
        return products;
    }
    public void saveProduct(Product product) {
        product.setId(products.get(products.size()-1).getId()+1);
        products.add(product);
    }
    public boolean deleteProduct(int id) {
        for (Product product1 : products){
            if (product1.getId()==id){
                products.remove(product1);
                return true;
            }
        }
        return false;
    }
    public List<Product> findProductByName(String name) {
        List<Product> matchedProducts = new ArrayList<>();
        List<Product> allProducts = findAllProduct(); // Giả sử đã có hàm này trả về danh sách sản phẩm

        if (name != null) {
            String searchName = name.toLowerCase();
            for (Product product : allProducts) {
                if (product.getName().toLowerCase().contains(searchName)) {
                    matchedProducts.add(product);
                }
            }
        }
        System.out.println(matchedProducts);
        return matchedProducts;
    }

    public Product findById(int id) {
        for(Product product:products){
            if (product.getId()==id){
                return product;
            }
        }
        return null;
    }

    public boolean updateProduct(int id,String name,String desc,int price) {
       for (Product product1 : products) {
           if (product1.getId()==id){
               product1.setName(name);
               product1.setDescription(desc);
               product1.setPrice(price);
               return true;
           }

       }return false;
    }
}
