var username = new URL(location.href).searchParams.get("username");
var user;

$(document).ready(function () {

    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });

    getUsuario().then(function () {

        $("#mi-perfil-btn").attr("href", "profile.html?username=" + username);

        $("#user-saldo").html(user.saldo.toFixed(2) + "$");

        getVideojuegos(false, "ASC");

        $("#ordenar-genero").click(ordenarVideojuegos);
    });
});


async function getUsuario() {

    await $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletUsuarioPedir",
        data: $.param({
            username: username
        }),
        success: function (result) {
            let parsedResult = JSON.parse(result);

            if (parsedResult != false) {
                user = parsedResult;
            } else {
                console.log("Error recuperando los datos del usuario");
            }
        }
    });

}
function getVideojuegos(ordenar, orden) {

    $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletVideojuegoListar",
        data: $.param({
            ordenar: ordenar,
            orden: orden
        }),
        success: function (result) {
            let parsedResult = JSON.parse(result);

            if (parsedResult != false) {
                mostrarVideojuegos(parsedResult);
            } else {
                console.log("Error recuperando los datos de los videojuegos");
            }
        }
    });
}

function mostrarVideojuegos(videojuegos) {

    let contenido = "";

    $.each(videojuegos, function (index, videojuego) {

        videojuego = JSON.parse(videojuego);
        let precio;

        if (videojuego.copias > 0) {

            if (user.premium) {

                if (videojuego.novedad) {
                    precio = (2 - (2 * 0.1));
                } else {
                    precio = (1 - (1 * 0.1));
                }
            } else {
                if (videojuego.novedad) {
                    precio = 2;
                } else {
                    precio = 1;
                }
            }

            contenido += '<tr><th scope="row">' + videojuego.id + '</th>' +
                    '<td>' + videojuego.nombre + '</td>' +
                    '<td>' + videojuego.fecha_estreno + '</td>' +
                    '<td>' + videojuego.genero + '</td>' +
                    '<td>' + videojuego.descripcion + '</td>' +
                    '<td>' + videojuego.modo_juego + '</td>' +
                    '<td>' + videojuego.clasificacion + '</td>' +
                    '<td>' + videojuego.idioma + '</td>' +
                    '<td>' + videojuego.copias + '</td>' +
                    '<td><input type="checkbox" name="novedad" id="novedad' + videojuego.id + '" disabled ';
            if (videojuego.novedad) {
                contenido += 'checked';
            }
            contenido += '></td>' +
                    '<td>' + precio + '</td>' +
                    '<td><button onclick="alquilarVideojuego(' + videojuego.id + ',' + precio + ');" class="btn btn-success" ';
            if (user.saldo < precio) {
                contenido += ' disabled ';
            }

            contenido += '>Reservar</button></td></tr>'

        }
    });
    $("#videojuegos-tbody").html(contenido);
}

function ordenarVideojuegos() {

    if ($("#icono-ordenar").hasClass("fa-sort")) {
        getVideojuegos(true, "ASC");
        $("#icono-ordenar").removeClass("fa-sort");
        $("#icono-ordenar").addClass("fa-sort-down");
    } else if ($("#icono-ordenar").hasClass("fa-sort-down")) {
        getVideojuegos(true, "DESC");
        $("#icono-ordenar").removeClass("fa-sort-down");
        $("#icono-ordenar").addClass("fa-sort-up");
    } else if ($("#icono-ordenar").hasClass("fa-sort-up")) {
        getVideojuegos(false, "ASC");
        $("#icono-ordenar").removeClass("fa-sort-up");
        $("#icono-ordenar").addClass("fa-sort");
    }
}

function alquilarVideojuego(id, precio) {

    $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletVideojuegoAlquilar",
        data: $.param({
            id: id,
            username: username

        }),
        success: function (result) {
            let parsedResult = JSON.parse(result);

            if (parsedResult != false) {
                restarDinero(precio).then(function () {
                    location.reload();
                })
            } else {
                console.log("Error en la reserva de la película");
            }
        }
    });
}


async function restarDinero(precio) {

    await $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletUsuarioRestarDinero",
        data: $.param({
            username: username,
            saldo: parseFloat(user.saldo - precio)

        }),
        success: function (result) {
            let parsedResult = JSON.parse(result);

            if (parsedResult != false) {
                console.log("Saldo actualizado");
            } else {
                console.log("Error en el proceso de pago");
            }
        }
    });
}

