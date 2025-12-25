<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>${pet.name}</title>
</head>
<body>

<h1>${pet.name}</h1>
<img src="${pet.mainPhotoURL}" width="300"><br><br>

<b>Breed:</b> ${pet.breed}<br>
<b>Gender:</b> ${pet.gender}<br>
<b>Age:</b> ${pet.ageInMonths} months<br>
<b>Location:</b> ${pet.locationCity}<br>
<b>Fee:</b> ${pet.adoptionFee}<br>

<p>${pet.description}</p>

<a href="pets">⬅ Back</a>

</body>
</html>
