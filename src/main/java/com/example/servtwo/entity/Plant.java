package com.example.servtwo.entity;

public class Plant {

    private int idPlant;
    private String name;
    private String description;
    private String picture;

    public Plant(int idPlant, String name, String description, String picture) {
        this.idPlant = idPlant;
        this.name = name;
        this.description = description;
        this.picture = picture;
    }

    public int getIdPlant() {
        return idPlant;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getPicture() {
        return picture;
    }
}
