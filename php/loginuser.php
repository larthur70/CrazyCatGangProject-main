<?php
session_start();

// Habilitar exibição de erros
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$servername = "127.0.0.1";
$username = "root";
$password = "123456";
$dbname = "db_ong";

// Criar conexão
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Inicializa a variável de resposta
$resposta = null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email']);
    $senha = trim($_POST['senha']);

    $stmt = $conn->prepare("SELECT idcliente, senha FROM cliente WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $senhaArmazenada);
        $stmt->fetch();

        if ($senha === $senhaArmazenada) {
            $_SESSION['usuario_id'] = $id;
            header("Location: ../GridClin.html");
            exit();
        } else {
            $resposta = "Senha incorreta.";
        }
    } else {
        $resposta = "Email não encontrado.";
    }

    $stmt->close();
}
$conn->close();

if ($resposta) {
    echo json_encode($resposta);
}
?>
