package com.example.servtwo.DB;

import com.example.servtwo.entity.Plant;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoadData {

    private static List<Plant> plants = new ArrayList<>();

    public static ArrayList<Plant> loadPlants() throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(DBConfig.URL, DBConfig.NAME, DBConfig.PASSWORD);
        Statement statement = connection.createStatement();
        String query = "select * from plants";
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()){
            plants.add(new Plant(resultSet.getInt("idplant"),resultSet.getString("name"),
                    resultSet.getString("description"), resultSet.getString("picture")));
        }
        connection.close();
        return (ArrayList<Plant>) plants;
    }

    public static ArrayList<Plant> changeNamePlants(String name, int idplant) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(DBConfig.URL, DBConfig.NAME, DBConfig.PASSWORD);
        String sql_update_name = "update plants set name='" + name + "' where idplant = " + idplant + ";";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql_update_name);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            connection.rollback();
            System.out.println("Error in update Title " + e);
        }
        finally {
            connection.close();
        }
        plants.clear();
        LoadData.loadPlants();
        return (ArrayList<Plant>) plants;
    }

    public static ArrayList<Plant> changeDescriptionPlants(String description, int idplant) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(DBConfig.URL, DBConfig.NAME, DBConfig.PASSWORD);
        String sql_update_description = "update plants set description='" + description + "' where idplant = " + idplant + ";";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql_update_description);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            connection.rollback();
            System.out.println("Error in update Title " + e);
        }
        finally {
            connection.close();
        }
        plants.clear();
        LoadData.loadPlants();
        return (ArrayList<Plant>) plants;
    }

    public static ArrayList<Plant> addPlants(String plantName,String plantDescription, String plantPicture) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(DBConfig.URL, DBConfig.NAME, DBConfig.PASSWORD);
        String sql_add_data = "insert into plants values ("+ plants.size() +", '"+plantName+"', '"+plantDescription+"','"+plantPicture+"');";
        PreparedStatement preparedStatement = connection.prepareStatement(sql_add_data);
        preparedStatement.executeUpdate();
        connection.close();
        plants.clear();
        LoadData.loadPlants();
        return (ArrayList<Plant>) plants;
    }
    public static ArrayList<Plant> deletePlants(int idPlant) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(DBConfig.URL, DBConfig.NAME, DBConfig.PASSWORD);
        String sql_delete = "delete from plants where idplant =" + idPlant + ";";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql_delete);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            connection.rollback();
            System.out.println("Error in delete data " + e);
        }
        finally {
            connection.close();
        }
        plants.clear();
        LoadData.loadPlants();
        return (ArrayList<Plant>) plants;
    }


    public static List<Plant> getPlants() {
        return plants;
    }
}
