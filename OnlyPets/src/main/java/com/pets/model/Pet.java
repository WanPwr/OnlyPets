package com.pets.model;

public class Pet {

    private int petID;
    private String name;
    private String category;
    private String breed;
    private int ageInMonths;
    private String gender;
    private String description;
    private boolean vaccinated;
    private boolean dewormed;
    private boolean neutered;
    private String locationCity;
    private double adoptionFee;
    private String mainPhotoURL;

    // GETTERS & SETTERS
    public int getPetID() { return petID; }
    public void setPetID(int petID) { this.petID = petID; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getBreed() { return breed; }
    public void setBreed(String breed) { this.breed = breed; }

    public int getAgeInMonths() { return ageInMonths; }
    public void setAgeInMonths(int ageInMonths) { this.ageInMonths = ageInMonths; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public boolean isVaccinated() { return vaccinated; }
    public void setVaccinated(boolean vaccinated) { this.vaccinated = vaccinated; }

    public boolean isDewormed() { return dewormed; }
    public void setDewormed(boolean dewormed) { this.dewormed = dewormed; }

    public boolean isNeutered() { return neutered; }
    public void setNeutered(boolean neutered) { this.neutered = neutered; }

    public String getLocationCity() { return locationCity; }
    public void setLocationCity(String locationCity) { this.locationCity = locationCity; }

    public double getAdoptionFee() { return adoptionFee; }
    public void setAdoptionFee(double adoptionFee) { this.adoptionFee = adoptionFee; }

    public String getMainPhotoURL() { return mainPhotoURL; }
    public void setMainPhotoURL(String mainPhotoURL) { this.mainPhotoURL = mainPhotoURL; }
}
