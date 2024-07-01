package com.example.bt1_ss9;

public class Service implements IService{
    @Override
    public double percentNumber(double price, double percent) {
        return( price * percent)/100;
    }

    @Override
    public double newPrice(double amount, double price) {
        return price - amount;
    }
}
