/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

/**
 *
 * @author jyu43
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserAddDAO {

    private Connection con;

    public void insertUser(String email, String password, String firstName, String lastName) throws Exception {
        try {
            String URL = "jdbc:mysql://localhost:3306/sakila";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "yujie-1276");
            try {
                Statement st = con.createStatement();
                int value = st
                        .executeUpdate("INSERT INTO userlogin(Email,Password,First_name,Last_name)VALUES('"
                                + email
                                + "','"
                                + password
                                + "','"
                                + firstName
                                + "','"
                                + lastName + "')");
                System.out.println("1 row affected" + value);
            } catch (SQLException ex) {
                System.out.println("SQL statement is not executed!" + ex);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
