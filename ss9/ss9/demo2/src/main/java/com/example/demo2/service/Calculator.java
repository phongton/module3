package com.example.demo2.service;

public class Calculator implements ICalculatorService{


    @Override
    public float multiplication(float a, float b) {
        return a*b;
    }
}
