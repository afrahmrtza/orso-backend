<?php
session_start();

// Proteksi login
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'pemilik') {
    header("Location: /login");
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

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body { background: #f8f5f0; font-family: 'Poppins', sans-serif; }
        .sidebar { background: linear-gradient(180deg, #3e2c1c, #2b1d12); min-height: 100vh; color: white; position: fixed; width: 260px; padding: 25px 20px; }
        .main-content { margin-left: 260px; padding: 35px; }
        .nav-link { color: #ddd; border-radius: 12px; padding: 10px; margin-bottom: 8px; border: none; background: none; text-align: left; }
        .nav-link:hover { background: rgba(255,255,255,0.08); color: white; }
        .nav-link.active { background: #6f4e37 !important; color: white !important; }
    </style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar text-center">
    <h4 class="fw-bold mt-2">ORSO OWNER</h4>
    <p class="small text-warning mb-4">Halo, <?= htmlspecialchars($nama_admin); ?> ☕</p>
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

<!-- CONTENT -->
<div class="main-content">
    <div class="tab-content">

        <div class="tab-pane fade show active" id="tab-summary">
            <?php include 'Components/dashboard_summary.php'; ?>
        </div>

        <div class="tab-pane fade" id="tab-pesanan">
            <?php include 'Components/manage_pesanan.php'; ?>
        </div>

        <div class="tab-pane fade" id="tab-menu">
            <?php include 'Components/manage_menu.php'; ?>
        </div>

        <div class="tab-pane fade" id="tab-user">
            <?php include 'Components/manage_user.php'; ?>
        </div>

        <div class="tab-pane fade" id="tab-testimoni">
            <?php include 'Components/manage_testimoni.php'; ?>
        </div>

        <div class="tab-pane fade" id="tab-laporan-bulanan">
            <?php include 'Components/report_penjualan.php'; ?>
        </div>

    </div>
</div>

<!-- ================= JAVASCRIPT ================= -->
<script>
const BASE_URL = "";

// ================= MENU =================
async function loadMenu() {
    try {
        const res = await fetch(BASE_URL + "/menu");
        const data = await res.json();

        let html = "";
        data.forEach(item => {
            html += `
                <tr>
                    <td>${item.nama_menu}</td>
                    <td>Rp ${item.harga}</td>
                </tr>
            `;
        });

        document.getElementById("menuTable").innerHTML = html;

    } catch (err) {
        console.error("Menu error:", err);
    }
}

// ================= USER =================
async function loadUsers() {
    const res = await fetch(BASE_URL + "/users");
    const data = await res.json();

    let html = "";
    data.forEach(user => {
        html += `
            <tr>
                <td>${user.nama}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
            </tr>
        `;
    });

    document.getElementById("userTable").innerHTML = html;
}

// ================= PESANAN =================
async function loadOrders() {
    const res = await fetch(BASE_URL + "/orders");
    const data = await res.json();

    let html = "";
    data.forEach(order => {
        html += `
            <tr>
                <td>${order.id_pesanan}</td>
                <td>Rp ${order.total_harga}</td>
                <td>${order.status_pesanan}</td>
            </tr>
        `;
    });

    document.getElementById("orderTable").innerHTML = html;
}

// ================= TESTIMONI =================
async function loadTestimoni() {
    const res = await fetch(BASE_URL + "/testimoni");
    const data = await res.json();

    let html = "";
    data.forEach(t => {
        html += `
            <tr>
                <td>${t.nama_user}</td>
                <td>${t.isi_testimoni}</td>
            </tr>
        `;
    });

    document.getElementById("testimoniTable").innerHTML = html;
}

// ================= DASHBOARD =================
async function loadLaporan() {
    console.log("Dashboard loaded");
}

// ================= LAPORAN =================
async function loadLaporanBulanan() {
    console.log("Laporan bulanan loaded");
}

// AUTO LOAD pertama
document.addEventListener("DOMContentLoaded", () => {
    loadLaporan();
});
</script>

</body>
</html>