package com.example.bt11_ss12.reponsitory;

import com.example.bt11_ss12.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {
    private static String jdbURL = "jdbc:mysql://localhost:3306/USER?useSSL=false";
    private static String dbUser = "root";
    private static String dbPass = "phongpro12";
    private static Connection connection = null;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbURL, dbUser, dbPass);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        return connection;
    }

    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = UserRepository.getConnection().prepareStatement("select * from Users");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    public void saveUser(User user) {
        List<User> users = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = UserRepository.getConnection().prepareStatement("insert into Users(name,email,country) values (?, ?, ?)");
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
    }

    public User findById(int id) {
        User user = null;
        try {
            PreparedStatement preparedStatement = UserRepository.getConnection().prepareStatement("select id,name,email,country from Users where id=?");
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet= preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public boolean deleteUser(int id) {
        boolean result ;
        try {
            PreparedStatement preparedStatement = UserRepository.getConnection().prepareStatement("delete from Users where id=?");
            preparedStatement.setInt(1, id);
           result= preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public List<User> findByName(String country) {
        List<User> users = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = UserRepository.getConnection().prepareStatement("select id,name,email,country from Users where  Lower(country)=Lower(?) ");
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    users.add(new User(id, name, email, country));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }
   public boolean updateUser(User user) {
        boolean result ;
        try {
            PreparedStatement preparedStatement = UserRepository.getConnection().prepareStatement("update Users set name=? ,email=?,country=? where id=?;");
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getCountry());
        preparedStatement.setInt(4, user.getId());
        result = preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public List<User> sortedName(){
        List<User> users = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = UserRepository.getConnection().prepareStatement("select id,name,email,country from Users order by name");

        ResultSet resultSet=preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String country = resultSet.getString("country");
            users.add(new User(id, name, email, country));
        }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }return users;
    }
}
