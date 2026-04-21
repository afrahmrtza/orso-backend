<h3 class="fw-bold mb-4">Moderasi Ulasan</h3>
<div class="table-container">
    <table class="table align-middle">
        <thead>
            <tr>
                <th>Nama</th>
                <th>Ulasan</th>
                <th>Foto</th>
                <th class="text-center">Aksi</th>
            </tr>
        </thead>
        <tbody id="table-testimoni-body"></tbody>
    </table>
</div>

<script>
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
        try {
            const res = await fetch(`${BASE_URL}/admin/testimoni/approve/${id}`, { 
                method: 'PUT', 
                headers: headers 
            });

            if (res.ok) {
                alert('Testimoni telah disetujui!');
                loadTestimoni(); 
            } else {
                alert('Gagal menyetujui testimoni.');
            }
        } catch (e) {
            console.error("Error Approve:", e);
        }
    }

    async function deleteT(id){
        if(confirm("Hapus ulasan ini?")){
            await fetch(`${BASE_URL}/owner/testimoni/${id}`, {method:"DELETE", headers});
            loadTestimoni();
        }
    }
</script>