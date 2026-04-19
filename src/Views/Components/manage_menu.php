<script>
async function loadMenu() {
    try {
        const res = await fetch(`${BASE_URL}/menu`);
        const data = await res.json();

        document.getElementById("table-menu-body").innerHTML = data.map(m => `
            <tr>
                <td>
                    <img src="/uploads/${m.image_url}" class="img-preview">
                </td>
                <td>${m.nama_menu}</td>
                <td>${m.kategori}</td>
                <td>Rp ${parseInt(m.harga).toLocaleString()}</td>
                <td>
                    <button onclick='openEditModal(${JSON.stringify(m)})' class="btn btn-sm text-primary">Edit</button>
                    <button onclick="deleteMenu(${m.id_menu})" class="btn btn-sm text-danger">Hapus</button>
                </td>
            </tr>
        `).join('');

    } catch (err) {
        console.error("Load menu error:", err);
    }
}

// ================= TAMBAH MENU =================
async function saveMenu(e) {
    e.preventDefault();
    const fd = new FormData(e.target);

    try {
        const res = await fetch(`${BASE_URL}/owner/menu`, {
            method: "POST",
            headers,
            body: fd
        });

        if (res.ok) {
            alert("Menu berhasil ditambahkan!");
            loadMenu();
            bootstrap.Modal.getInstance(document.getElementById('modalTambahMenu')).hide();
            e.target.reset();
        } else {
            alert("Gagal menambah menu");
        }

    } catch (err) {
        console.error("Save error:", err);
    }
}

// ================= EDIT MODAL =================
function openEditModal(menu) {
    document.getElementById('edit-id').value = menu.id_menu;
    document.getElementById('edit-nama').value = menu.nama_menu;
    document.getElementById('edit-harga').value = menu.harga;
    document.getElementById('edit-kategori').value = menu.kategori;
    document.getElementById('edit-deskripsi').value = menu.deskripsi || '';

    new bootstrap.Modal(document.getElementById('modalEditMenu')).show();
}

// ================= UPDATE =================
async function updateMenu(e) {
    e.preventDefault();
    const id = document.getElementById('edit-id').value;
    const fd = new FormData(e.target);

    try {
        const res = await fetch(`${BASE_URL}/owner/menu/${id}`, {
            method: "POST", // kalau belum support PUT di Slim
            headers,
            body: fd
        });

        if (res.ok) {
            alert("Menu berhasil diperbarui!");
            loadMenu();
            bootstrap.Modal.getInstance(document.getElementById('modalEditMenu')).hide();
        } else {
            alert("Gagal update menu");
        }

    } catch (err) {
        console.error("Update error:", err);
    }
}

// ================= DELETE =================
async function deleteMenu(id) {
    if (confirm("Hapus menu ini secara permanen?")) {
        try {
            const res = await fetch(`${BASE_URL}/owner/menu/${id}`, {
                method: "DELETE",
                headers
            });

            if (res.ok) {
                alert("Menu berhasil dihapus!");
                loadMenu();
            } else {
                alert("Gagal hapus menu");
            }

        } catch (err) {
            console.error("Delete error:", err);
        }
    }
}
</script>