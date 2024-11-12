package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			Doctor d= new Doctor(id,fullName,dob,qualification,spec,email,mobno,"");
			DoctorDao dao=new DoctorDao(DBConnect.getConn());
			HttpSession session=req.getSession();
			
			if(dao.editDoctorProfile(d)) {
				Doctor updateDoctor=dao.getDoctorById(id);
				session.setAttribute("successd", "Doctor Update Successfully");
				session.setAttribute("doctorObj", updateDoctor);
				resp.sendRedirect("doctor/editProfile.jsp");
			}else {
				session.setAttribute("errord", "Something went wrong on server");
				resp.sendRedirect("doctor/editProfile.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
