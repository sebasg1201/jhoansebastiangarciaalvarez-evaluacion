<?php
require '../config/database.php';
$db = new Database();
$con = $db->conectar();

if (isset($_POST['inicio'])) {
    $documento = $_POST['documento'] ?? null;
    $clave = $_POST['clave'] ?? null;

    if (empty($documento) || empty($clave)) {
        header("Location: ../index.php");
        exit();
    }

    $sql = $con->prepare("SELECT u.*, t.tip_user 
                          FROM user u 
                          INNER JOIN id_tip_user t ON u.id_tip_user = t.id_tip_user 
                          WHERE u.documento = :documento");
    $sql->bindParam(':documento', $documento);
    $sql->execute();

    if ($sql->rowCount() == 1) {
        $fila = $sql->fetch(PDO::FETCH_ASSOC);

        if (password_verify($clave, $fila['contrasena']) && strtolower($fila['tip_user']) === 'cajero') {
            session_start();
            $_SESSION['documento'] = $fila['documento'];
            $_SESSION['nombre'] = $fila['nombre'];
            $_SESSION['rol'] = $fila['tip_user'];

            header("Location: ../cajero/inicio_cajero.php");
            exit();
        }
    }

    echo '<script>alert("Credenciales incorrectas o no tienes rol de cajero.");</script>';
    echo '<script>window.location="../index.php";</script>';
    exit();
} else {
    header("Location: ../index.php");
    exit();
}
