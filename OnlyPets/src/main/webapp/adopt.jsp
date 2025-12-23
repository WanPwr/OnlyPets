<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Only Pets - ${pet.name}</title>
    <style>
        /* --- Basic Reset and Typography --- */
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }
        .container { width: 80%; margin: 20px auto; background-color: white; padding: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        .header, .footer { background-color: #333; color: white; padding: 10px 0; text-align: center; }
        .nav-links { float: right; }
        .nav-links a { color: white; margin-left: 15px; text-decoration: none; }
        .title-bar { border-bottom: 2px solid #333; padding-bottom: 10px; margin-bottom: 20px; }

        /* --- Pet Details Section --- */
        .pet-header { display: flex; justify-content: space-between; align-items: center; }
        .pet-details-section { display: flex; gap: 40px; margin-top: 20px; }
        .pet-image-main { width: 350px; height: 350px; object-fit: cover; }
        .details-list { flex-grow: 1; display: grid; grid-template-columns: auto 1fr; gap: 10px; }
        .details-list b { font-weight: bold; }
        .gallery-container { flex-grow: 2; text-align: center; }
        .gallery-main-image { width: 100%; height: 350px; object-fit: cover; }
        
        /* --- Contact and Footer Section --- */
        .bottom-section { display: flex; margin-top: 40px; border-top: 1px solid #ccc; padding-top: 20px; }
        .contact-form-container { flex: 1; padding-right: 20px; border-right: 1px solid #eee; }
        .more-cats-container { flex: 2; padding-left: 20px; }
        
        /* --- Form Styling --- */
        .contact-form h3 { margin-top: 0; }
        .contact-form input[type="text"], 
        .contact-form input[type="email"], 
        .contact-form textarea {
            width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; box-sizing: border-box;
        }
        .name-row { display: flex; gap: 15px; margin-bottom: 15px; }
        .name-row input { flex: 1; }
        .contact-form button { background-color: black; color: white; padding: 10px 20px; border: none; cursor: pointer; width: 100%; margin-bottom: 15px; }
        .social-logos { display: flex; justify-content: space-around; }
        .social-logos button { background-color: black; color: white; padding: 8px; border: none; cursor: pointer; font-size: 12px; }

        /* --- More Pets Gallery Styling --- */
        .more-cats-gallery { display: flex; flex-wrap: wrap; gap: 15px; }
        .pet-card { width: calc(33.33% - 10px); text-align: center; padding: 10px; border: 1px solid #eee; }
        .pet-card img { width: 100%; height: 120px; object-fit: cover; }
        .pet-card button { background-color: #f0f0f0; border: 1px solid #ccc; padding: 5px 10px; cursor: pointer; margin-top: 5px; }
        
        /* --- Utility Classes --- */
        .line-separator { border-top: 1px solid #ccc; margin: 20px 0; }
        .back-button { background-color: #ccc; border: none; padding: 5px 10px; cursor: pointer; margin-bottom: 10px; }
    </style>
</head>
<body>

    <header class="header">
        <div class="container" style="display: flex; justify-content: space-between; align-items: center; background-color: #333;">
            <span style="font-size: 1.5em; font-weight: bold;">Only Pets</span>
            <div class="nav-links">
                <a href="#">Home</a>
                <a href="#">About Us</a>
                <a href="#">Lost & Found</a>
                <button style="background-color: red; color: white; padding: 5px 10px; border: none; cursor: pointer;">LIST A PET</button>
            </div>
        </div>
    </header>

    <div class="container">
        <button class="back-button">Back</button>

        <div class="title-bar">
            <h1>${pet.name}</h1>
            <p>${pet.description}</p>
        </div>

        <div class="pet-details-section">
            <div>
                <img src="${pet.mainPhotoUrl}" alt="${pet.name}" class="pet-image-main">
            </div>

            <div class="details-list">
                <b>Name:</b> <span>${pet.name}</span>
                <b>Age:</b> <span>${pet.ageInMonths} Months ${pet.ageInDays} Days</span>
                <b>Gender:</b> <span>${pet.gender}</span>
                <b>Colour:</b> <span>${pet.colour}</span>
                <b>Vaccinated:</b> <span>${pet.isVaccinated ? 'Yes' : 'No'}</span>
                <b>Dewormed:</b> <span>${pet.isDewormed ? 'Yes' : 'No'}</span>
                <b>Spayed:</b> <span>${pet.isNeutered ? 'Yes' : 'No'}</span>
                <b>Address:</b> <span>${pet.address}</span>
                <b>Posted:</b> <span>${pet.postedDate} (last updated ${pet.lastUpdatedRelative})</span>
                <b>Adoption Fee:</b> <span>RMB${pet.adoptionFee}</span>
            </div>

            <div class="gallery-container">
                <h2 style="text-align: left;">Gallery</h2>
                <img src="${pet.mainPhotoUrl}" alt="Gallery Main" class="gallery-main-image">
                </div>
        </div>

        <div class="line-separator"></div>

        <div class="bottom-section">
            <div class="contact-form-container">
                <h3>Do you have more questions? Contact me!</h3>
                <form action="contactHandler" method="POST" class="contact-form">
                    <input type="hidden" name="petID" value="${pet.petID}">
                    
                    <div class="name-row">
                        <input type="text" name="firstName" placeholder="First name" value="Jane" required>
                        <input type="text" name="lastName" placeholder="Last name" value="Smithton" required>
                    </div>
                    
                    <input type="email" name="emailAddress" placeholder="Email address" value="email@domain.net" required>
                    
                    <textarea name="message" rows="4" placeholder="Enter your question or message" required></textarea>
                    
                    <button type="submit">Submit</button>
                </form>

                <div class="social-logos">
                    <button>Whatsapp Logo</button>
                    <button>Facebook Logo</button>
                    <button>Instagram Logo</button>
                </div>
            </div>

            <div class="more-cats-container">
                <h3 style="margin-top: 0;">More cats!</h3>
                <div class="more-cats-gallery">
                    <c:forEach var="relatedPet" items="${relatedPets}">
                        <div class="pet-card">
                            <img src="${relatedPet.photoURL}" alt="${relatedPet.name}">
                            <h4>${relatedPet.name}</h4>
                            <p>${relatedPet.description}</p>
                            <button>Adopt</button>
                        </div>
                    </c:forEach>
                    
                    <div class="pet-card">
                        <img src="path/to/cat1.jpg" alt="Miguel">
                        <h4>Miguel</h4>
                        <p>Description of first product</p>
                        <button>Adopt</button>
                    </div>
                    <div class="pet-card">
                        <img src="path/to/cat2.jpg" alt="El Pasa Condor">
                        <h4>El Pasa Condor</h4>
                        <p>Description of second product</p>
                        <button>Adopt</button>
                    </div>
                    <div class="pet-card">
                        <img src="path/to/cat3.jpg" alt="Jeb">
                        <h4>Jeb</h4>
                        <p>Description of third product</p>
                        <button>Adopt</button>
                    </div>
                    <div class="pet-card">
                        <img src="path/to/cat4.jpg" alt="Product 4">
                        <h4>Product</h4>
                        <p>Description of fourth product</p>
                        <button>Adopt</button>
                    </div>
                    <div class="pet-card">
                        <img src="path/to/cat5.jpg" alt="Product 5">
                        <h4>Product</h4>
                        <p>Description of fifth product</p>
                        <button>Adopt</button>
                    </div>
                    <div class="pet-card">
                        <img src="path/to/cat6.jpg" alt="Product 6">
                        <h4>Product</h4>
                        <p>Description of sixth product</p>
                        <button>Adopt</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>