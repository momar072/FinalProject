/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import org.apache.struts.action.Action;

/**
 *
 * @author jyu43
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class registerAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession ses = request.getSession(true);

        registerForm registerForm = (registerForm) form;
        String email = registerForm.getEmail();
        String password = registerForm.getPassword();
        String firstName = registerForm.getFirstName();
        String lastName = registerForm.getLastName();

        UserAddDAO dao = new UserAddDAO();

        dao.insertUser(email, password, firstName, lastName);
        return mapping.findForward("response");

    }
}
