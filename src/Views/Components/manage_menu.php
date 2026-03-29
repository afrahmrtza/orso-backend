<div class="d-flex justify-content-between align-items-center mb-4">
    <h3 class="fw-bold">Manajemen Menu</h3>
    <button class="btn btn-dark px-4 rounded-pill" data-bs-toggle="modal" data-bs-target="#modalTambahMenu">+ Tambah Menu</button>
</div>

<div class="table-container">
    <table class="table table-hover align-middle">
        <thead>
            <tr>
                <th>Foto</th>
                <th>Nama</th>
                <th>Kategori</th>
                <th>Harga</th>
                <th class="text-center">Opsi</th>
            </tr>
        </thead>
        <tbody id="table-menu-body"></tbody>
    </table>
</div>

<div class="modal fade" id="modalTambahMenu" tabindex="-1">
    <div class="modal-dialog">
        <form class="modal-content" id="formTambahMenu" onsubmit="saveMenu(event)">
            <div class="modal-header fw-bold">Tambah Menu Baru</div>
            <div class="modal-body">
                <input name="nama_menu" class="form-control mb-3" placeholder="Nama Menu" required>
                <input name="harga" type="number" class="form-control mb-3" placeholder="Harga" required>
                <select name="kategori" class="form-select mb-3">
                    <option value="Coffee">Coffee</option>
                    <option value="Non-Coffee">Non-Coffee</option>
                    <option value="Mojito">Mojito</option>
                </select>
                <textarea name="deskripsi" class="form-control mb-3" placeholder="Deskripsi"></textarea>
                <input type="file" name="image_url" class="form-control">
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-success w-100 fw-bold">Simpan Menu</button>
            </div>
        </form>
    </div>
</div>

<div class="modal fade" id="modalEditMenu" tabindex="-1">
    <div class="modal-dialog">
        <form class="modal-content" id="formEditMenu" onsubmit="updateMenu(event)">
            <div class="modal-header fw-bold">Edit Menu</div>
            <div class="modal-body">
                <input type="hidden" id="edit-id">
                <input id="edit-nama" name="nama_menu" class="form-control mb-3" required>
                <input id="edit-harga" name="harga" type="number" class="form-control mb-3" required>
                <select id="edit-kategori" name="kategori" class="form-select mb-3">
                    <option value="Coffee">Coffee</option>
                    <option value="Non-Coffee">Non-Coffee</option>
                    <option value="Mojito">Mojito</option>
                </select>
                <textarea id="edit-deskripsi" name="deskripsi" class="form-control mb-3"></textarea>
                <input type="file" name="image_url" class="form-control">
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary w-100 fw-bold">Update Menu</button>
            </div>
        </form>
    </div>
</div>

<script>
async function loadMenu(){
const data = await fetch(`${BASE_URL}/menu`).then(r=>r.json());
document.getElementById("table-menu-body").innerHTML = data.map(m=>`
    <tr>
        <td><img src="${BASE_URL}/uploads/menu/${m.image_url}" class="img-preview"></td>
        <td>${m.nama_menu}</td>
        <td>${m.kategori}</td>
        <td>Rp ${parseInt(m.harga).toLocaleString()}</td>
        <td>
            <button onclick='openEditModal(${JSON.stringify(m)})' class="btn btn-sm text-primary">Edit</button>
            <button onclick="deleteMenu(${m.id_menu})" class="btn btn-sm text-danger">Hapus</button>
        </td>
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
// Fungsi untuk membuka modal dan mengisi data otomatis
function openEditModal(menu) {
    document.getElementById('edit-id').value = menu.id_menu;
    document.getElementById('edit-nama').value = menu.nama_menu;
    document.getElementById('edit-harga').value = menu.harga;
    document.getElementById('edit-kategori').value = menu.kategori;
    document.getElementById('edit-deskripsi').value = menu.deskripsi || '';
    
    new bootstrap.Modal(document.getElementById('modalEditMenu')).show();
}

// Fungsi untuk mengirim data yang diedit ke API
async function updateMenu(e) {
    e.preventDefault();
    const id = document.getElementById('edit-id').value;
    const fd = new FormData(e.target);

    try {
        const res = await fetch(`${BASE_URL}/owner/menu/${id}`, {
            method: "POST", 
            headers: headers,
            body: fd
        });

        if (res.ok) {
            alert("Menu berhasil diperbarui!");
            loadMenu();
            bootstrap.Modal.getInstance(document.getElementById('modalEditMenu')).hide();
        } else {
            alert("Gagal mengupdate menu");
        }
    } catch (err) {
        console.error("Update Error:", err);
    }
}

async function deleteMenu(id){
    if(confirm("Hapus menu ini secara permanen?")){
        await fetch(`${BASE_URL}/owner/menu/${id}`, {method:"DELETE", headers});
        loadMenu();
    }
}
</script>