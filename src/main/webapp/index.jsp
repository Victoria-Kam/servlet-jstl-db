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

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Комнатные растения</h1>
                <p class="lead text-muted">Данная страница была сделана в качестве теста и получения практического
                    навыка подключения bootstrap. Оно принесло довольно много страданий верстальщику, который понял что
                    до full stack develoder'а еще идти и идти))</p>
                <p>
                    <a href="https://jungle.by/catalog/komnatnye-rasteniya" class="btn btn-primary my-2">Ссылка на сайт,
                        где были взяты растения</a>
                    <br>
                    <br>
                <form action="setting" method="get">
                    <button>
                        <p class="btn btn-primary my-2">настройки </p>
                    </button>
                </form>
                </p>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <core:forEach var="plant" items="${plants}">
                    <div class="col">
                        <p style="text-align: center">${plant.name}</p>
                        <div class="card shadow-sm">
                            <img src=${plant.picture}>

                            <div class="card-body">
                                <p class="card-text">${plant.description}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary">Подробнее
                                        </button>
                                        <button type="button" class="btn btn-sm btn-outline-secondary">Купить</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </core:forEach>
            </div>

        </div>
    </div>
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