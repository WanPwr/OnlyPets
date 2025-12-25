<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Pet</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: 500;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        textarea {
            height: 80px;
            resize: vertical;
        }

        .checkbox-group {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
        }

        .checkbox-group label {
            display: flex;
            align-items: center;
            font-weight: normal;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background-color: #4a90e2;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #357ABD;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Pet</h1>

        <form action="addPetHandler" method="post" enctype="multipart/form-data">

            <label for="name">Name</label>
            <input type="text" name="name" id="name" required>

            <label for="category">Category</label>
            <input type="text" name="category" id="category">

            <label for="breed">Breed</label>
            <input type="text" name="breed" id="breed">

            <label for="ageInMonths">Age (months)</label>
            <input type="number" name="ageInMonths" id="ageInMonths">

            <label for="gender">Gender</label>
            <select name="gender" id="gender">
                <option>Male</option>
                <option>Female</option>
            </select>

            <label for="description">Description</label>
            <textarea name="description" id="description"></textarea>

            <label for="locationCity">City</label>
            <input type="text" name="locationCity" id="locationCity">

            <label for="adoptionFee">Fee</label>
            <input type="number" name="adoptionFee" id="adoptionFee">

            <div class="checkbox-group">
                <label><input type="checkbox" name="isVaccinated"> Vaccinated</label>
                <label><input type="checkbox" name="isDewormed"> Dewormed</label>
                <label><input type="checkbox" name="isNeutered"> Neutered</label>
            </div>

            <label for="petPhotos">Photo</label>
            <input type="file" name="petPhotos" id="petPhotos">

            <button type="submit">Save</button>

        </form>
    </div>
</body>
</html>
