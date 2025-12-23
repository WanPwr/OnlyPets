<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Only Pets - Add a New Pet</title>
    <style>
        /* --- General Layout and Reset --- */
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; color: #333; }
        .header-bg { background-color: black; color: white; padding: 10px 0; }
        .main-container { width: 90%; max-width: 1000px; margin: 0 auto; }
        
        /* --- Header and Navigation --- */
        .header-content { display: flex; justify-content: space-between; align-items: center; width: 100%; }
        .site-title { font-size: 1.5em; font-weight: bold; }
        .nav-links a { color: white; margin-left: 15px; text-decoration: none; }
        .list-pet-btn { background-color: red; color: white; padding: 5px 10px; border: none; cursor: pointer; }
        .nav-links { display: flex; align-items: center; }

        /* --- Form Container Styling --- */
        .form-card { 
            background-color: white; 
            padding: 30px; 
            margin-top: 30px; 
            border-radius: 8px; 
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); 
        }
        .form-header { 
            border-bottom: 1px solid #eee; 
            padding-bottom: 15px; 
            margin-bottom: 20px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center;
        }
        .form-header h2 { margin: 0; }

        /* --- Image Upload Area --- */
        .image-upload-section { 
            border: 2px dashed #ccc; 
            padding: 40px; 
            text-align: center; 
            margin-bottom: 30px; 
            cursor: pointer;
        }
        .image-upload-section p { color: #888; margin: 0; }
        .thumbnail-preview { display: flex; gap: 10px; margin-top: 15px; justify-content: center; }
        .thumbnail-preview div { width: 50px; height: 50px; background-color: #eee; border: 1px solid #ccc; }

        /* --- Form Grid and Inputs --- */
        .input-grid {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }
        .full-width { grid-column: 1 / 4; }
        .input-group { margin-bottom: 15px; }
        .input-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .input-group input[type="text"],
        .input-group select,
        .input-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        /* --- Checkbox/Radio Styling --- */
        .attribute-section { padding-top: 20px; border-top: 1px solid #eee; }
        .checkbox-row { margin-bottom: 15px; }
        .checkbox-row label { margin-right: 20px; }
        
        /* --- Form Footer/Actions --- */
        .form-actions { 
            display: flex; 
            justify-content: flex-end; 
            gap: 10px; 
            padding-top: 20px; 
            border-top: 1px solid #eee; 
            margin-top: 20px; 
        }
        .cancel-btn { background-color: #ccc; color: #333; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        .publish-btn { background-color: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>

    <header class="header-bg">
        <div class="main-container header-content">
            <span class="site-title">Only Pets</span>
            <nav class="nav-links">
                <a href="index.jsp">Home</a>
                <a href="#">Profiles</a>
                <a href="#">Deployment</a>
                <a href="#">Manage pet</a>
                <button class="list-pet-btn">LIST A PET</button>
            </nav>
        </div>
    </header>

    <div class="main-container">
        <h1>Add pet</h1>
        
        <div class="form-card">
            
            <div class="form-header">
                <h2>List a New Pet</h2>
                <button style="background: none; border: none; font-size: 1.5em; cursor: pointer;">&times;</button>
            </div>
            
            <form action="addPetHandler" method="POST" enctype="multipart/form-data">
                
                <h3 style="margin-top: 0; font-size: 1.2em;">Pet Photos</h3>
                
                <div class="image-upload-section" onclick="document.getElementById('fileUpload').click()">
                    <p>Click to upload images</p>
                    <p>or drag and drop. Max file size: 5MB</p>
                    <input type="file" id="fileUpload" name="petPhotos" accept="image/*" multiple style="display: none;">
                </div>
                
                <div class="thumbnail-preview">
                    <div></div>
                    <div></div>
                </div>

                <h3 style="margin-top: 30px; font-size: 1.2em; border-top: 1px solid #eee; padding-top: 20px;">Basic Information</h3>

                <div class="input-grid">
                    
                    <div class="input-group">
                        <label for="petName">Pet Name</label>
                        <input type="text" id="petName" name="name" placeholder="Pet Name" required>
                    </div>

                    <div class="input-group">
                        <label for="category">Category</label>
                        <select id="category" name="category" required>
                            <option value="">Select Category</option>
                            <option value="Dog">Dog</option>
                            <option value="Cat">Cat</option>
                            <option value="Rabbit">Rabbit</option>
                        </select>
                    </div>

                    <div class="input-group">
                        <label for="breed">Breed</label>
                        <input type="text" id="breed" name="breed" placeholder="Breed (e.g., Beagle)" required>
                    </div>

                    <div class="input-group">
                        <label for="ageInMonths">Age (Months)</label>
                        <input type="number" id="ageInMonths" name="ageInMonths" placeholder="Age in Months" min="0">
                    </div>

                    <div class="input-group">
                        <label for="gender">Gender</label>
                        <select id="gender" name="gender" required>
                            <option value="">Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                </div>
                
                <div class="input-group full-width">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" rows="4" placeholder="Description (Personality, Health, History)" required></textarea>
                </div>
                
                <h3 style="margin-top: 30px; font-size: 1.2em; border-top: 1px solid #eee; padding-top: 20px;">Health & Fees</h3>

                <div class="input-grid" style="grid-template-columns: 1fr 1fr;">
                    
                    <div class="checkbox-row">
                         <label>
                            <input type="checkbox" name="isVaccinated" value="true"> Vaccinated
                        </label>
                        <label>
                            <input type="checkbox" name="isDewormed" value="true"> Dewormed
                        </label>
                        <label>
                            <input type="checkbox" name="isNeutered" value="true"> Spayed/Neutered
                        </label>
                    </div>

                    <div class="input-group">
                        <label for="locationCity">City | Location</label>
                        <input type="text" id="locationCity" name="locationCity" placeholder="City, State/Region" required>
                    </div>

                    <div class="input-group">
                         <label for="adoptionFee">Adoption Fee (Optional)</label>
                        <input type="number" id="adoptionFee" name="adoptionFee" placeholder="$ Adoption Fee" min="0">
                    </div>

                </div>

                <div class="form-actions">
                    <button type="button" class="cancel-btn" onclick="window.history.back()">Cancel</button>
                    <button type="submit" class="publish-btn">Publish Listing</button>
                </div>
            </form>
            
        </div>
    </div>
    
</body>
</html>