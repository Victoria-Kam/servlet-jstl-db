package com.example.servtwo;

import com.example.servtwo.DB.LoadData;
import com.example.servtwo.entity.Plant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "settingServlet", value = "/setting")
public class SettingServlet extends HttpServlet {

    private LoadData loadData;
    private ArrayList<Plant> plants;

    public void init() {
        plants = new ArrayList<>();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // возвращаем список данных для этого сервлета
       plants = (ArrayList<Plant>) LoadData.getPlants();

        request.setAttribute("plants", plants);
        getServletContext().getRequestDispatcher("/pageSetting.jsp").forward(request, response);

    }

    public void destroy() {

    }
}
