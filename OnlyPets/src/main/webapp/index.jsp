<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Only Pets - Find a Furry Friend!</title>
    <style>
        /* --- General Layout and Reset --- */
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; color: #333; }
        .header-bg { background-color: black; color: white; padding: 10px 0; }
        .main-container { width: 90%; max-width: 1200px; margin: 0 auto; display: flex; }

        /* --- Header and Navigation --- */
        .header-content { display: flex; justify-content: space-between; align-items: center; width: 100%; }
        .site-title { font-size: 1.5em; font-weight: bold; }
        .nav-links a { color: white; margin-left: 15px; text-decoration: none; }
        .list-pet-btn { background-color: red; color: white; padding: 5px 10px; border: none; cursor: pointer; }

        /* --- Hero Section --- */
        .hero-section { display: flex; align-items: center; padding: 50px 0; background-color: white; border-bottom: 1px solid #ddd; }
        .hero-text { flex: 1; padding-right: 30px; }
        .hero-text h1 { font-size: 2.5em; margin-bottom: 10px; }
        .hero-image { flex: 1; text-align: right; }
        .hero-image img { max-width: 100%; height: auto; border-radius: 5px; }

        /* --- Main Content Layout --- */
        .content-wrapper { display: flex; padding-top: 20px; }
        .sidebar { width: 250px; padding-right: 20px; }
        .pet-gallery { flex-grow: 1; display: flex; flex-wrap: wrap; gap: 20px; }

        /* --- Sidebar Filters --- */
        .filter-group { margin-bottom: 20px; padding: 15px; background-color: white; border: 1px solid #eee; border-radius: 5px; }
        .filter-group h4 { margin-top: 0; border-bottom: 1px solid #ccc; padding-bottom: 5px; }
        .tag-list { display: flex; flex-wrap: wrap; gap: 5px; margin-bottom: 15px; }
        .tag { background-color: #ddd; padding: 3px 8px; border-radius: 3px; font-size: 0.9em; display: flex; align-items: center; }
        .tag button { background: none; border: none; margin-left: 5px; cursor: pointer; color: #555; font-weight: bold; }
        .checkbox-group label { display: block; margin-bottom: 5px; }
        .input-group input[type="range"] { width: 100%; }
        .input-group input[type="text"] { width: 90%; padding: 5px; border: 1px solid #ccc; margin-top: 5px; }
        .input-group label { display: block; font-size: 0.9em; margin-bottom: 5px; }

        /* --- Pet Card Styling --- */
        .pet-card { 
            width: calc(33.33% - 14px); /* Three cards per row minus gap compensation */
            background-color: white; 
            border: 1px solid #ddd; 
            border-radius: 5px; 
            overflow: hidden; 
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        .pet-card img { 
            width: 100%; 
            height: 200px; 
            object-fit: cover; 
        }
        .pet-info { padding: 10px; }
        .pet-info h4 { margin: 5px 0; font-size: 1.2em; }
        .pet-info p { margin: 0 0 10px 0; font-size: 0.9em; color: #666; }
        .adopt-btn { 
            background-color: orange; 
            color: white; 
            padding: 8px 20px; 
            border: none; 
            border-radius: 3px; 
            cursor: pointer; 
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <header class="header-bg">
        <div class="main-container header-content">
            <span class="site-title">Only Pets</span>
            <div class="nav-links">
                <a href="index.jsp">Home</a>
                <a href="#">About Us</a>
                <a href="#">Lost & Found</a>
                <button class="list-pet-btn">LIST A PET</button>
            </div>
        </div>
    </header>

    <div class="main-container hero-section">
        <div class="hero-text">
            <h1>Find yourself a little furry friend now!</h1>
            <p style="font-size: 1.2em; color: #666;">Adoption</p>
        </div>
        <div class="hero-image">
            <img src="path/to/hero_image.jpg" alt="Cute kitten" />
        </div>
    </div>

    <div class="main-container content-wrapper">

        <aside class="sidebar">
            <form action="searchPets" method="GET">
                
                <div class="filter-group">
                    <h4>Keywords</h4>
                    <div class="tag-list">
                        <span class="tag">Cat <button type="button">X</button></span>
                        <span class="tag">Big <button type="button">X</button></span>
                        <span class="tag">Black <button type="button">X</button></span>
                    </div>
                </div>

                <div class="filter-group checkbox-group">
                    <h4>Attributes</h4>
                    <label>
                        <input type="checkbox" name="vaccinated" value="true" checked> Vaccinated
                    </label>
                    <label>
                        <input type="checkbox" name="dewormed" value="true"> Dewormed
                    </label>
                    <label>
                        <input type="checkbox" name="neutered" value="true" checked> Spayed
                    </label>
                </div>

                <div class="filter-group input-group">
                    <h4>Adoption Fee (RMB)</h4>
                    <label for="feeRange">0 - 100</label>
                    <input type="range" id="feeRange" name="maxFee" min="0" max="100" value="100">
                </div>

                <div class="filter-group input-group">
                    <h4>Species</h4>
                    <input type="text" name="species" placeholder="Species" />
                </div>
                 <div class="filter-group input-group">
                    <h4>Breed</h4>
                    <input type="text" name="breed" placeholder="Breed" />
                </div>
                
                </form>
        </aside>

        <main class="pet-gallery">
            <h2 style="width: 100%; margin-bottom: 20px;">Animals</h2>

            <c:forEach var="pet" items="${petList}">
                <div class="pet-card">
                    <a href="petDetail?petID=${pet.petID}">
                        <img src="${pet.mainPhotoURL}" alt="${pet.name}" />
                    </a>
                    <div class="pet-info">
                        <h4>${pet.name}</h4>
                        <p>${pet.description}</p>
                        <a href="petDetail?petID=${pet.petID}">
                             <button class="adopt-btn">Adopt!</button>
                        </a>
                    </div>
                </div>
            </c:forEach>
            
            <div class="pet-card">
                <img src="path/to/maximus.jpg" alt="Maximus Calculus" />
                <div class="pet-info">
                    <h4>Maximus Calculus</h4>
                    <p>Description</p>
                    <button class="adopt-btn">Adopt!</button>
                </div>
            </div>
            <div class="pet-card">
                <img src="path/to/gang.jpg" alt="Me & the gang" />
                <div class="pet-info">
                    <h4>Me & the gang</h4>
                    <p>Description</p>
                    <button class="adopt-btn">Adopt!</button>
                </div>
            </div>
            <div class="pet-card">
                <img src="path/to/beezybuddy.jpg" alt="Beezybuddy" />
                <div class="pet-info">
                    <h4>Beezybuddy</h4>
                    <p>Description</p>
                    <button class="adopt-btn">Adopt!</button>
                </div>
            </div>
            <div class="pet-card">
                <img src="path/to/mrhalfway.jpg" alt="Mr Halfway" />
                <div class="pet-info">
                    <h4>Mr Halfway</h4>
                    <p>Description</p>
                    <button class="adopt-btn">Adopt!</button>
                </div>
            </div>
            
            <div class="pet-card">
                <img src="path/to/datastructure.jpg" alt="Data structure" />
                <div class="pet-info">
                    <h4>Data structure</h4>
                    <p>Description</p>
                    <button class="adopt-btn">Adopt!</button>
                </div>
            </div>
             <div class="pet-card">
                <img src="path/to/softengine.jpg" alt="Soft engine" />
                <div class="pet-info">
                    <h4>Soft engine</h4>
                    <p>Description</p>
                    <button class="adopt-btn">Adopt!</button>
                </div>
            </div>
             <div class="pet-card">
                <img src="path/to/hardhalfway.jpg" alt="Hard halfway" />
                <div class="pet-info">
                    <h4>Hard halfway</h4>
                    <p>Description</p>
                    <button class="adopt-btn">Adopt!</button>
                </div>
            </div>
             <div class="pet-card">
                <img src="path/to/mushywaity.jpg" alt="Mushy-waity" />
                <div class="pet-info">
                    <h4>Mushy-waity</h4>
                    <p>Description</p>
                    <button class="adopt-btn">Adopt!</button>
                </div>
            </div>

        </main>
    </div>
    
    </body>
</html>