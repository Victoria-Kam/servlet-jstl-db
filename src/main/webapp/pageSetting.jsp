<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>thml and bootstrap</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
</head>

<body>
<header>
    <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container" style="background-color: rgba(55, 56, 55, 0.767);">
            <a href="#" class="navbar-brand d-flex align-items-center"
               style="background-color: rgba(55, 56, 55, 0.767);">
                <strong>Комнатные растения</strong>
            </a>
        </div>
    </div>
</header>

<main>
    <div>
        <table style=" border: 1px solid grey;" id="plant-table">
            <th style="border: 1px solid grey;">ID</th>
            <th style="border: 1px solid grey;">Название</th>
            <th style="border: 1px solid grey;">Описание</th>
            <core:forEach var="plant" items="${plants}">
                <tr>
                    <td style="border: 1px solid grey;">${plant.idPlant}</td>
                    <td style="border: 1px solid grey;">${plant.name}</td>
                    <td style="border: 1px solid grey;">${plant.description}</td>
                </tr>
            </core:forEach>
            </tr>
        </table>
    </div>

    <div>
        <form action="${pageContext.request.contextPath}/change-data-servlet" method="post">
            <br>
            <label>ID</label>
            <input type="text" name="idPlant">
            <br>
            <label>Название</label>
            <input type="text" name="namePlant">
            <br>
            <label>Описание</label>
            <input type="text" name="descriptionPlant">
            <br>
            <label><input type="radio"  name="choice" value="add">добавить</label>
            <br>
            <label><input type="radio" name="choice" value="changeName">изменить имя</label>
            <br>
            <label><input type="radio" name="choice" value="changeDescription">изменить описание</label>
            <br>
            <label><input type="radio" name="choice" value="delete">удалить</label>
            <br>
            <input type="submit">
        </form>
    </div>
</main>

<div class="container">
    <footer class="py-3 my-4">
        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
        </ul>
        <p class="text-center text-muted">© 2022 Test</p>
    </footer>
</div>


<script src="/docs/5.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
