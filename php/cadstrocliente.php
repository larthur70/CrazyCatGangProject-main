<?php
$servername = "localhost"; // ou o endereço do seu servidor
$username = "root";
$password = "123456";
$dbname = "db_ong";

// Criar conexão
$connexao = new mysqli($servername, $username, $password, $dbname);

// Verificar conexão
if ($connexao->connect_error) {
    die("Conexão falhou: " . $conexao->connect_error);
}

// Receber dados do formulário
$nome = $_POST['nome'];
$email = $_POST['email'];
$cpf = $_POST['cpf'];
$telefone = $_POST['telefone'];
$endereco = $_POST['endereco'];
$senha = $_POST['senha'];

if(empty($nome) || empty($email) || empty($email) || empty($email) || empty($email) || empty($email)){
    $resposta = "Preencha todos os dados";
} 
else {
    // Preparar e executar a query
    $stmt = $connexao->prepare("INSERT INTO cliente (email,senha,nome,cpf,telefone,endereco) VALUES (?, ?, ?,?,?,?)");
    $stmt->bind_param("ssssss", $email,$senha,$nome,$cpf,$telefone,$endereco);

    if ($stmt->execute()) {
        $resposta = "Usuário cadastrado com sucesso!";
    } else {
        $resposta = "Erro: " . $stmt->error;
    }
    // Fechar conexão
    $stmt->close();
    $connexao->close();
}

echo(json_encode($resposta));
?>



