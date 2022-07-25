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

@WebServlet(name = "changeDataServlet", value = "/change-data-servlet")
public class ChangeDataServlet extends HttpServlet {

    private ArrayList<Plant> plants = new ArrayList<>();

    private Integer idPlant;
    private String namePlant;
    private String descriptionPlant;
    private String userChoice;

    public void init() {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idPlant = Integer.parseInt(request.getParameter("idPlant"));
        if(idPlant == null){
            idPlant = 0;
        }
        namePlant = request.getParameter("namePlant");
        descriptionPlant = request.getParameter("descriptionPlant");
        userChoice = request.getParameter("choice");

        this.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {   // загружаем данные в коллекцию для этого сервлета
            plants = LoadData.loadPlants();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (userChoice.equals("add")) {
            try {
                plants = LoadData.addPlants(namePlant, descriptionPlant, "hello");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (userChoice.equals("changeName")) {
            try {
                plants = LoadData.changeNamePlants(namePlant, idPlant);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (userChoice.equals("changeDescription")) {
            try {
                plants = LoadData.changeDescriptionPlants(descriptionPlant, idPlant);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (userChoice.equals("delete")) {
            try {
                plants = LoadData.deletePlants(idPlant);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        request.setAttribute("plants", plants);
        // для обновления страницы, где можно редактировать данные
        getServletContext().getRequestDispatcher("/pageSetting.jsp").forward(request, response);
    }
}

