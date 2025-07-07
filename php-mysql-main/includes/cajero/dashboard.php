<?php
session_start();
if (!isset($_SESSION['nombre']) || $_SESSION['rol'] !== 'Cajero') {
    header("Location: ../index.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Panel Cajero</title>
</head>
<body>
    <h1>Bienvenido, <?php echo $_SESSION['nombre']; ?>. Eres un <?php echo $_SESSION['rol']; ?>.</h1>
</body>
</html>
