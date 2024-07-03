package service.iml;

import service.ProductService;

public class Service implements ProductService {
    @Override
    public double percent(double price, double percent) {
        return (price * percent) / 100;
    }

    @Override
    public double newPrice(double amount, double price) {
        return price - amount;
    }
}
