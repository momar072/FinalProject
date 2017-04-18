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

    public void insertFilm(String film_id, String title, String description,
            String release_year, String language_id, String original_language_id,
            String rental_duration, String rental_rate, String length,
            String replacement_cost, String rating, String special_features,
            String last_update) throws Exception {
        try {
            String URL = "jdbc:mysql://localhost:3306/sakila";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "root");
            try {
                Statement st = con.createStatement();
                int value = st
                        .executeUpdate("INSERT INTO userlogin(film_id,title,description,"
                                + "release_year,language_id,original_language_id,"
                                + "rental_duration,rental_rate,length,replacement_cost"
                                + "rating,special_features,last_update)VALUES('"
                                + film_id
                                + "','"
                                + title
                                + "','"
                                + description
                                + "','"
                                + release_year
                                + "','"
                                + language_id
                                + "','"
                                + original_language_id
                                + "','"
                                + rental_duration
                                + "','"
                                + rental_rate
                                + "','"
                                + length
                                + "','"
                                + replacement_cost
                                + "','"
                                + rating
                                + "','"
                                + special_features
                                + "','"
                                + last_update + "')");
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
