package com.example.servtwo;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.servtwo.DB.LoadData;
import com.example.servtwo.entity.Plant;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    private LoadData loadData;
    private ArrayList<Plant> plants;

    public void init() {
        loadData = new LoadData();
        plants = new ArrayList<>();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       if(plants.size() == 0) {
           try {
               plants = loadData.loadPlants();
           } catch (ClassNotFoundException e) {
               e.printStackTrace();
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }

        request.setAttribute("plants", plants);
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

    }

    public void destroy() {

    }
}