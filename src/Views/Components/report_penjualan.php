<div class="mb-4">
    <h3 class="fw-bold">Laporan Penjualan Perbulan</h3>
    <small class="text-muted">Total pendapatan yang berstatus 'Selesai'.</small>
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

<script>
    window.loadLaporan = async function() {
        try {
            console.log("Fetching dashboard summary...");
            const resRep = await fetch(`${BASE_URL}/admin/reports`, { headers });
            const rep = await resRep.json();
            
            // Update elemen statistik di dashboard_summary jika ada
            const elHari = document.getElementById("rep-hari");
            const elBulan = document.getElementById("rep-bulan");
            if (elHari) elHari.innerText = `Rp ${parseInt(rep.harian || 0).toLocaleString('id-ID')}`;
            if (elBulan) elBulan.innerText = `Rp ${parseInt(rep.bulanan || 0).toLocaleString('id-ID')}`;

            // Update statistik jumlah data
            const menus = await fetch(`${BASE_URL}/menu`).then(r => r.json());
            const elStatMenu = document.getElementById("stat-menu");
            if (elStatMenu) elStatMenu.innerText = menus.length;

            const orders = await fetch(`${BASE_URL}/admin/orders`, { headers }).then(r => r.json());
            const elStatPesanan = document.getElementById("stat-pesanan");
            if (elStatPesanan) elStatPesanan.innerText = orders.length;

            const testimonials = await fetch(`${BASE_URL}/owner/testimoni`, { headers }).then(r => r.json());
            const pending = testimonials.filter(t => t.status_persetujuan === 'pending').length;
            const elStatTesti = document.getElementById("stat-testimoni");
            if (elStatTesti) elStatTesti.innerText = pending;

        } catch (e) { 
            console.error("Error Dashboard Summary:", e); 
        }
    };

    window.loadLaporanBulanan = async function() {
        try {
            console.log("Fetching monthly reports...");
            const res = await fetch(`${BASE_URL}/admin/orders`, { headers });
            const orders = await res.json();
        
            // Filter hanya pesanan yang sudah selesai
            const ordersSelesai = orders.filter(o => o.status_pesanan === 'selesai');

            const monthNames = [
                "Januari", "Februari", "Maret", "April", "Mei", "Juni",
                "Juli", "Agustus", "September", "Oktober", "November", "Desember"
            ];

            const grouping = ordersSelesai.reduce((acc, order) => {
                const tglDb = order.tgl_pesanan; 
                if (tglDb) {
                    const date = new Date(tglDb);
                    const bulan = monthNames[date.getMonth()];
                    const tahun = date.getFullYear();
                    const key = `${bulan} ${tahun}`;
                
                    if (!acc[key]) {
                        acc[key] = { total: 0, count: 0 };
                    }
                    acc[key].total += parseFloat(order.total_harga);
                    acc[key].count += 1;
                }
                return acc;
            }, {});

            const tbody = document.getElementById("table-laporan-bulanan-body");
            const keys = Object.keys(grouping);

            if (keys.length === 0) {
                tbody.innerHTML = `<tr><td colspan="3" class="text-center py-4 text-muted">Tidak ada data penjualan yang berstatus 'selesai'.</td></tr>`;
                return;
            }

            tbody.innerHTML = keys.map(key => `
                <tr>
                    <td><span class="fw-bold">${key}</span></td>
                    <td>${grouping[key].count} Transaksi</td>
                    <td><span class="text-success fw-bold">Rp ${grouping[key].total.toLocaleString('id-ID')}</span></td>
                </tr>
            `).join('');

        } catch (e) {
            console.error("Gagal memuat laporan bulanan:", e);
            document.getElementById("table-laporan-bulanan-body").innerHTML = 
                `<tr><td colspan="3" class="text-center text-danger">Gagal mengambil data dari server.</td></tr>`;
        }
    };
</script>