/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Christopher Gately
 */
public class filmsForRentDAO {
    
    private Connection con;

    //Insert movie into rental table and delete movie from inventory table
    public void insertFilmAfterRented(String rental_date, String inventory_id, String customer_id,
            String return_date, String staff_id, String last_update) throws Exception {
        try {

            String URL = "jdbc:mysql://localhost:3306/sakila";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "root");
            try {
                Statement st = con.createStatement();
                int value = st
                        .executeUpdate("INSERT INTO rental(rental_date,inventory_id,"
                                + "customer_id,return_date,staff_id,last_update)VALUES('"
                                + rental_date
                                + "','"
                                + inventory_id
                                + "','"
                                + customer_id
                                + "','"
                                + return_date
                                + "','"
                                + staff_id
                                + "','"
                                + last_update + "')");
                System.out.println("1 row affected" + value);
            } catch (SQLException ex) {
                System.out.println("SQL statement is not executed!" + ex);
            }
            
            //Delete Film from Inventory
            try {
                Statement st = con.createStatement();
                int value = st
                        .executeUpdate("Delete from inventory where inventory_id = " + inventory_id + "");
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
