import service.ProductService;
import service.iml.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "ProductInformation", value = "/product")
public class ProductInformation extends HttpServlet {
    private ProductService productService = new Service();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            double price = Double.parseDouble(request.getParameter("price"));
            double percent = Double.parseDouble(request.getParameter("percent"));
            double amount = productService.percent(price,percent);
            double newPrice = productService.newPrice(amount,price);
            request.setAttribute("amount",amount);
            request.setAttribute("newPrice",newPrice);
            request.getRequestDispatcher("amount.jsp").forward(request, response);
    }
}
