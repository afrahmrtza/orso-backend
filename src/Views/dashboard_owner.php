<?php
session_start();

// Proteksi Halaman
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
        body {
            background: #f8f5f0;
            font-family: 'Poppins', sans-serif;
        }

        /* SIDEBAR */
        .sidebar {
            background: linear-gradient(180deg, #3e2c1c, #2b1d12);
            min-height: 100vh;
            color: white;
            position: fixed;
            width: 260px;
            padding: 25px 20px;
            box-shadow: 5px 0 20px rgba(0,0,0,0.1);
            z-index: 1000;
        }

        .sidebar h4 { letter-spacing: 1px; }

        .sidebar .nav-link {
            color: #ddd;
            border-radius: 12px;
            padding: 10px 15px;
            margin-bottom: 8px;
            transition: 0.3s;
            font-weight: 500;
            border: none;
            width: 100%;
            text-align: left;
        }

        .sidebar .nav-link:hover {
            background: rgba(255,255,255,0.08);
            color: white;
            transform: translateX(5px);
        }

        .sidebar .nav-link.active {
            background: #6f4e37 !important;
            color: white !important;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        /* MAIN CONTENT */
        .main-content {
            margin-left: 260px;
            padding: 35px;
        }

        .dashboard-header {
            background: white;
            padding: 20px 25px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            margin-bottom: 25px;
        }

        /* CARDS */
        .card-stats {
            border: none;
            border-radius: 18px;
            padding: 20px;
            background: white;
            transition: 0.3s;
            box-shadow: 0 8px 25px rgba(0,0,0,0.05);
        }

        .card-stats:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.1);
        }

        .icon-box {
            width: 50px;
            height: 50px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin-bottom: 12px;
        }

        /* TABLES */
        .table-container {
            background: white;
            padding: 25px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }

        .table thead {
            background: #6f4e37;
            color: white;
        }

        .img-preview {
            width: 55px;
            height: 55px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid #eee;
        }

        .btn-dark { background: #4b3621; border: none; }
        .btn-dark:hover { background: #6f4e37; }
    </style>
</head>
<body>

<div class="sidebar text-center">
    <h4 class="fw-bold mb-1 mt-2">ORSO OWNER</h4>
    <p class="small text-warning mb-4">Halo, <?php echo htmlspecialchars($nama_admin); ?> ☕</p>
    <hr>
    <div class="nav flex-column nav-pills">
        <button class="nav-link active" data-bs-toggle="pill" data-bs-target="#tab-laporan" onclick="initDashboard()">📊 Dashboard</button>
        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#tab-pesanan" onclick="loadOrders()">🛒 Pesanan</button>
        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#tab-menu" onclick="loadMenu()">☕ Menu</button>
        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#tab-testimoni" onclick="loadTestimoni()">💬 Ulasan</button>
        <a href="/logout" class="nav-link text-danger mt-5 text-decoration-none" onclick="return confirm('Yakin ingin keluar?')">🚪 Logout</a>
    </div>
</div>

<div class="main-content">
    <div class="tab-content">

        <div class="tab-pane fade show active" id="tab-laporan">
            <div class="dashboard-header d-flex justify-content-between align-items-center">
                <div>
                    <h4 class="fw-bold mb-1">Business Overview</h4>
                    <small class="text-muted">Pantau performa bisnis secara real-time</small>
                </div>
                <span class="badge bg-success p-2">Online</span>
            </div>

            <div class="row g-4 mb-4">
                <div class="col-md-3">
                    <div class="card-stats">
                        <div class="icon-box bg-primary text-white">☕</div>
                        <small class="text-muted">Total Menu</small>
                        <h3 id="stat-menu" class="fw-bold">0</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-stats">
                        <div class="icon-box bg-success text-white">📦</div>
                        <small class="text-muted">Total Pesanan</small>
                        <h3 id="stat-pesanan" class="fw-bold">0</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-stats">
                        <div class="icon-box bg-warning text-dark">💬</div>
                        <small class="text-muted">Pending Review</small>
                        <h3 id="stat-testimoni" class="fw-bold">0</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-stats border-start border-success border-4">
                        <div class="icon-box bg-light text-success">💰</div>
                        <small class="text-muted">Omzet Bulan Ini</small>
                        <h3 id="rep-bulan" class="fw-bold text-success">Rp 0</h3>
                    </div>
                </div>
            </div>

            <div class="table-container text-center py-4 mb-5">
                <small class="text-muted">Pendapatan Hari Ini</small>
                <h1 id="rep-hari" class="fw-bold text-success display-5">Rp 0</h1>
            </div>

            <div class="mb-3">
                <h4 class="fw-bold">Laporan Penjualan Perbulan</h4>
                <small class="text-muted">Akumulasi pendapatan dari pesanan berstatus 'Selesai'.</small>
            </div>
            <div class="table-container">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th>Bulan & Tahun</th>
                            <th>Jumlah Transaksi</th>
                            <th>Total Pendapatan</th>
                        </tr>
                    </thead>
                    <tbody id="table-laporan-bulanan-body"></tbody>
                </table>
            </div>
        </div>

        <div class="tab-pane fade" id="tab-pesanan">
            <h3 class="fw-bold mb-4">Daftar Transaksi</h3>
            <div class="table-container">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Pelanggan</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody id="table-orders-body"></tbody>
                </table>
            </div>
        </div>

        <div class="tab-pane fade" id="tab-menu">
            <div class="d-flex justify-content-between mb-4">
                <h3 class="fw-bold">Manajemen Menu</h3>
                <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#modalTambahMenu">+ Tambah Menu</button>
            </div>
            <div class="table-container">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th>Foto</th>
                            <th>Nama</th>
                            <th>Kategori</th>
                            <th>Harga</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                    <tbody id="table-menu-body"></tbody>
                </table>
            </div>
        </div>

        <div class="tab-pane fade" id="tab-testimoni">
            <h3 class="fw-bold mb-4">Moderasi Ulasan</h3>
            <div class="table-container">
                <table class="table align-middle">
                    <thead>
                        <tr>
                            <th>Nama</th>
                            <th>Ulasan</th>
                            <th>Foto</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody id="table-testimoni-body"></tbody>
                </table>
            </div>
        </div>

    </div>
</div>

<div class="modal fade" id="modalTambahMenu">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="formTambahMenu" onsubmit="saveMenu(event)">
                <div class="modal-header fw-bold">Tambah Menu Baru</div>
                <div class="modal-body">
                    <input name="nama_menu" class="form-control mb-3" placeholder="Nama Menu" required>
                    <input name="harga" type="number" class="form-control mb-3" placeholder="Harga" required>
                    <select name="kategori" class="form-select mb-3">
                        <option>Coffee</option>
                        <option>Non-Coffee</option>
                        <option>Makanan</option>
                    </select>
                    <textarea name="deskripsi" class="form-control mb-3" placeholder="Deskripsi"></textarea>
                    <label class="small text-muted mb-1">Upload Gambar:</label>
                    <input type="file" name="image_url" class="form-control">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success w-100 fw-bold">SIMPAN MENU</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="modalDetailPesanan">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header fw-bold">Detail Pesanan Pelanggan</div>
            <div class="modal-body">
                <div id="detail-info" class="alert alert-secondary py-2 mb-3"></div>
                <table class="table table-bordered">
                    <thead class="table-light">
                        <tr><th>Menu</th><th>Harga</th><th>Qty</th><th>Subtotal</th></tr>
                    </thead>
                    <tbody id="detail-items"></tbody>
                </table>
                <h4 class="text-end fw-bold mt-3">Total: <span id="detail-total" class="text-success">Rp 0</span></h4>
            </div>
        </div>
    </div>
</div>

<script>
const BASE_URL = "http://127.0.0.1:8000";
const headers = { "X-Role": "pemilik" };

// --- FUNGSI DASHBOARD & LAPORAN ---

async function initDashboard() {
    await loadLaporan();
    await loadLaporanBulanan();
}

async function loadLaporan() {
    try {
        const rep = await fetch(`${BASE_URL}/admin/reports`, { headers }).then(r=>r.json());
        document.getElementById("rep-hari").innerText = `Rp ${parseInt(rep.harian||0).toLocaleString('id-ID')}`;
        document.getElementById("rep-bulan").innerText = `Rp ${parseInt(rep.bulanan||0).toLocaleString('id-ID')}`;

        const menus = await fetch(`${BASE_URL}/menu`).then(r=>r.json());
        document.getElementById("stat-menu").innerText = menus.length;

        const orders = await fetch(`${BASE_URL}/admin/orders`, { headers }).then(r=>r.json());
        document.getElementById("stat-pesanan").innerText = orders.length;

        const testimonials = await fetch(`${BASE_URL}/owner/testimoni`, { headers }).then(r=>r.json());
        const pending = testimonials.filter(t => t.status_persetujuan === 'pending').length;
        document.getElementById("stat-testimoni").innerText = pending;
    } catch (e) { console.error("Error Dashboard:", e); }
}

async function loadLaporanBulanan() {
    try {
        const res = await fetch(`${BASE_URL}/admin/orders`, { headers });
        const orders = await res.json();
        const ordersSelesai = orders.filter(o => o.status_pesanan === 'selesai');

        const monthNames = ["Januari", "Februari", "Maret", "April", "Mei", "Juni",
                            "Juli", "Agustus", "September", "Oktober", "November", "Desember"];

        const grouping = ordersSelesai.reduce((acc, order) => {
            const tglDb = order.tgl_pesanan; 
            if (tglDb) {
                const date = new Date(tglDb);
                const bulan = monthNames[date.getMonth()];
                const tahun = date.getFullYear();
                const key = `${bulan} ${tahun}`;
            
                if (!acc[key]) acc[key] = { total: 0, count: 0 };
                acc[key].total += parseFloat(order.total_harga);
                acc[key].count += 1;
            }
            return acc;
        }, {});

        const tbody = document.getElementById("table-laporan-bulanan-body");
        const keys = Object.keys(grouping);

        if (keys.length === 0) {
            tbody.innerHTML = `<tr><td colspan="3" class="text-center py-4 text-muted">Belum ada data penjualan selesai.</td></tr>`;
            return;
        }

        tbody.innerHTML = keys.map(key => `
            <tr>
                <td><span class="fw-bold">${key}</span></td>
                <td>${grouping[key].count} Transaksi</td>
                <td><span class="text-success fw-bold">Rp ${grouping[key].total.toLocaleString('id-ID')}</span></td>
            </tr>
        `).join('');
    } catch (e) { console.error("Gagal memuat laporan bulanan:", e); }
}

// --- FUNGSI PESANAN ---

async function loadOrders() {
    try {
        const orders = await fetch(`${BASE_URL}/admin/orders`, { headers }).then(r=>r.json());
        document.getElementById("table-orders-body").innerHTML = orders.map(o => `
            <tr>
                <td><strong>ORSO-${o.id_pesanan}</strong></td>
                <td>${o.nama}</td>
                <td>Rp ${parseInt(o.total_harga).toLocaleString('id-ID')}</td>
                <td><span class="badge ${o.status_pesanan==='selesai'?'bg-success':'bg-warning text-dark'}">${o.status_pesanan}</span></td>
                <td>
                    <button onclick="showDetail(${o.id_pesanan})" class="btn btn-sm btn-info text-white">Detail</button>
                    ${o.status_pesanan!=='selesai' && o.status_pesanan!=='dibatalkan'
                    ? `<button onclick="updateStatus(${o.id_pesanan})" class="btn btn-sm btn-outline-success">Selesai</button>`
                    : '-'}
                </td>
            </tr>`).join('');
    } catch (e) { console.error("Error Orders:", e); }
}

async function updateStatus(id){
    if(confirm("Tandai pesanan ini sebagai selesai?")){
        await fetch(`${BASE_URL}/admin/orders/complete/${id}`, {method:"PUT", headers});
        loadOrders();
    }
}

async function showDetail(id){
    const data = await fetch(`${BASE_URL}/orders/detail/${id}`).then(r=>r.json());
    document.getElementById("detail-info").innerHTML = `ID Transaksi: <strong>ORSO-${id}</strong>`;
    document.getElementById("detail-items").innerHTML = data.map(i => `
        <tr>
            <td>${i.nama_menu}</td>
            <td>Rp ${parseInt(i.harga).toLocaleString('id-ID')}</td>
            <td>${i.jumlah_pesanan}</td>
            <td>Rp ${(i.harga*i.jumlah_pesanan).toLocaleString('id-ID')}</td>
        </tr>`).join('');
    const total = data.reduce((t,i)=>t+(i.harga*i.jumlah_pesanan),0);
    document.getElementById("detail-total").innerText = `Rp ${total.toLocaleString('id-ID')}`;
    new bootstrap.Modal(document.getElementById("modalDetailPesanan")).show();
}

// --- FUNGSI MENU ---

async function loadMenu(){
    const data = await fetch(`${BASE_URL}/menu`).then(r=>r.json());
    document.getElementById("table-menu-body").innerHTML = data.map(m=>`
        <tr>
            <td><img src="${BASE_URL}/uploads/menu/${m.image_url}" class="img-preview"></td>
            <td>${m.nama_menu}</td>
            <td>${m.kategori}</td>
            <td>Rp ${parseInt(m.harga).toLocaleString('id-ID')}</td>
            <td><button onclick="deleteMenu(${m.id_menu})" class="btn btn-sm text-danger">Hapus</button></td>
        </tr>`).join('');
}

async function saveMenu(e){
    e.preventDefault();
    const fd = new FormData(e.target);
    await fetch(`${BASE_URL}/owner/menu`, {method:"POST", headers, body:fd});
    loadMenu();
    bootstrap.Modal.getInstance(document.getElementById('modalTambahMenu')).hide();
    e.target.reset();
}

async function deleteMenu(id){
    if(confirm("Hapus menu ini secara permanen?")){
        await fetch(`${BASE_URL}/owner/menu/${id}`, {method:"DELETE", headers});
        loadMenu();
    }
}

// --- FUNGSI TESTIMONI ---

async function loadTestimoni(){
    const data = await fetch(`${BASE_URL}/owner/testimoni`, {headers}).then(r=>r.json());
    document.getElementById("table-testimoni-body").innerHTML = data.map(t=>`
        <tr>
            <td><strong>${t.nama}</strong></td>
            <td>"${t.isi_testimoni}"</td>
            <td><img src="${BASE_URL}/uploads/testimoni/${t.foto_testimoni}" class="img-preview" onerror="this.src='${BASE_URL}/uploads/menu/${t.foto_testimoni}'"></td>
            <td>
                ${t.status_persetujuan==='pending'
                ? `<button onclick="approveT(${t.id_testimoni})" class="btn btn-sm btn-primary">Setujui</button>`
                : '<span class="badge bg-success">Publik</span>'}
                <button onclick="deleteT(${t.id_testimoni})" class="btn btn-sm btn-outline-danger">Hapus</button>
            </td>
        </tr>`).join('');
}

async function approveT(id) {
    const res = await fetch(`${BASE_URL}/admin/testimoni/approve/${id}`, { method: 'PUT', headers });
    if (res.ok) { alert('Testimoni disetujui!'); loadTestimoni(); }
}

async function deleteT(id){
    if(confirm("Hapus ulasan ini?")){
        await fetch(`${BASE_URL}/owner/testimoni/${id}`, {method:"DELETE", headers});
        loadTestimoni();
    }
}

window.onload = initDashboard;
</script>

</body>
</html>