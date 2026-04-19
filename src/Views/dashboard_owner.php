<?php
session_start();
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'pemilik') {
    header("Location: login.php");
    exit();
}
$nama_admin = $_SESSION['nama'] ?? 'Admin';
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owner Dashboard - Orso Coffee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body { background: #f8f5f0; font-family: 'Poppins', sans-serif; }
        .sidebar { background: linear-gradient(180deg, #3e2c1c, #2b1d12); min-height: 100vh; color: white; position: fixed; width: 260px; padding: 25px 20px; z-index: 1000; }
        .main-content { margin-left: 260px; padding: 35px; }
        .nav-link { color: #ddd; border-radius: 12px; padding: 10px 15px; margin-bottom: 8px; transition: 0.3s; border: none; background: none; width: 100%; text-align: left; }
        .nav-link:hover { background: rgba(255,255,255,0.08); color: white; }
        .nav-link.active { background: #6f4e37 !important; color: white !important; }
        .table-container { background: white; padding: 25px; border-radius: 18px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); }
        .card-stats { border: none; border-radius: 18px; padding: 20px; background: white; box-shadow: 0 8px 25px rgba(0,0,0,0.05); }
        .img-preview { width: 55px; height: 55px; object-fit: cover; border-radius: 10px; }
    </style>
</head>
<body>

<div class="sidebar text-center">
    <h4 class="fw-bold mb-1 mt-2">ORSO OWNER</h4>
    <p class="small text-warning mb-4">Halo, <?php echo htmlspecialchars($nama_admin); ?> ☕</p>
    <hr>
    <div class="nav flex-column nav-pills">
        <button class="nav-link active" data-bs-toggle="pill" data-bs-target="#tab-summary" onclick="loadLaporan()">📊 Dashboard</button>
        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#tab-pesanan" onclick="loadOrders()">🛒 Pesanan</button>
        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#tab-menu" onclick="loadMenu()">☕ Menu</button>
        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#tab-user" onclick="loadUsers()">👥 User</button>
        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#tab-testimoni" onclick="loadTestimoni()">💬 Ulasan</button>
        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#tab-laporan-bulanan" onclick="loadLaporanBulanan()">📜 Laporan</button>
        <a href="/logout" class="nav-link text-danger mt-5 text-decoration-none">🚪 Logout</a>
    </div>
</div>

<div class="main-content">
    <div class="tab-content">
        <div class="tab-pane fade show active" id="tab-summary"><?php include 'Components/dashboard_summary.php'; ?></div>
        <div class="tab-pane fade" id="tab-pesanan"><?php include 'Components/manage_pesanan.php'; ?></div>
        <div class="tab-pane fade" id="tab-menu"><?php include 'Components/manage_menu.php'; ?></div>
        <div class="tab-pane fade" id="tab-user"><?php include 'Components/manage_user.php'; ?></div>
        <div class="tab-pane fade" id="tab-testimoni"><?php include 'Components/manage_testimoni.php'; ?></div>
        <div class="tab-pane fade" id="tab-laporan-bulanan"><?php include 'Components/report_penjualan.php'; ?></div>
    </div>
</div>

<script>
    const BASE_URL = "";
    const headers = { "X-Role": "pemilik" };
</script>
</body>
</html>