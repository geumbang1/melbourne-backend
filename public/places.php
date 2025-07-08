<?php
header('Content-Type: application/json');

// DB 접속 정보
$host = 'mysql.railway.internal';
$port = 3306;
$db   = 'railway';
$user = 'root';
$pass = 'RypAsSiIyofSfSFGQPlGHmbQVFOTyyPw';

try {
    $dsn = "mysql:host=$host;port=$port;dbname=$db;charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $pass);

    $stmt = $pdo->query("SELECT * FROM places");
    $places = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($places);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => $e->getMessage()]);
}
