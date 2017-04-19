package com.myapp.struts;




import java.sql.Date;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Christopher Gately
 */
public class filmsForRentAction {
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession ses = request.getSession(true);

        filmsForRentForm filmsForRentForm = (filmsForRentForm) form;
        Integer film_Id = filmsForRentForm.getFilm_id();
        String title = filmsForRentForm.getTitle();
        String description = filmsForRentForm.getDescription();
        Date release_year = filmsForRentForm.getRelease_year();
        Integer language_id = filmsForRentForm.getLanguage_id();
        Integer original_language_id = filmsForRentForm.getOriginal_language_id();
        Integer rental_duration = filmsForRentForm.getRental_duration();
        Integer rental_rate = filmsForRentForm.getRental_rate();
        Integer length = filmsForRentForm.getLength();
        Integer replacement_cost = filmsForRentForm.getReplacement_cost();
        String rating = filmsForRentForm.getRating();
        String special_features = filmsForRentForm.getSpecial_features();
        Timestamp last_update = filmsForRentForm.getLast_update();
        
        
        ses.setAttribute("film_Id", film_Id);
        ses.setAttribute("title", title);
        ses.setAttribute("description", description);
        ses.setAttribute("release_year", release_year);
        ses.setAttribute("language_id", language_id);
        ses.setAttribute("original_language_id", original_language_id);
        ses.setAttribute("rental_duration", rental_duration);
        ses.setAttribute("rental_rate", rental_rate);
        ses.setAttribute("length", length);
        ses.setAttribute("replacement_cost", replacement_cost);
        ses.setAttribute("rating", rating);
        ses.setAttribute("special_features", special_features);
        ses.setAttribute("last_update", last_update);
//        if (film_Id.equals("") || title.equals("") || description.equals("")
//              || release_year.equals("") || language.equals("") 
//              || original_language_id.equals("")) || rental_duration.equals("")
//              || rental_date.equals("")|| length.equals("")
//              || replacement_cost.equals("") || rating.equals("")
//               || special_features.equals("")|| last_update.equals(""){
//           return mapping.findForward("error");
//        }
//        filmsForRentDAO dao = new filmsForRentDAO();
//
//        dao.insertFilmAfterRented(rental_date,inventory_id,customer_id,
//            return_date,staff_id,last_update);
        return mapping.findForward("response");
    }
    
}
