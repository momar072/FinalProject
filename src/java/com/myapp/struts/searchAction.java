/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import org.apache.struts.action.Action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class searchAction extends Action{
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession ses = request.getSession(true);

        searchForm searchForm = (searchForm) form;
        String filmId = searchForm.getFilmId();
        String category = searchForm.getCategory();
        String actor = searchForm.getActor();
        String store = searchForm.getStore();
        if(filmId == "")
        {
            filmId = "%";
        }if(category == "")
        {
            category = "%";
        }if(actor == "")
        {
            actor = "%";
        }if(store == "")
        {
            store = "%";
        }
        ses.setAttribute("filmId", filmId);
        ses.setAttribute("category", category);
        ses.setAttribute("actor", actor);
        ses.setAttribute("store", store);
        return mapping.findForward("response");
    }
}
