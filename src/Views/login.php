<?php
session_start();
if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] == 'pemilik') header("Location: dashboard_owner.php");
    else if ($_SESSION['role'] == 'kasir') header("Location: dashboard_kasir.php");
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login - Orso Coffee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/4ad0b8b5a4.js" crossorigin="anonymous"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            margin: 0;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                        url('https://images.unsplash.com/photo-1509042239860-f550ce710b93');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            backdrop-filter: blur(12px);
            background: rgba(255,255,255,0.1);
            border-radius: 20px;
            padding: 45px;
            width: 380px;
            color: white;
            box-shadow: 0 8px 30px rgba(0,0,0,0.4);
            animation: fadeIn 1s ease-in-out;
        }

        .login-card h3 {
            font-weight: 700;
            letter-spacing: 2px;
        }

        .form-control {
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
        }

        .form-control::placeholder {
            color: #ddd;
        }

        .form-control:focus {
            background: rgba(255,255,255,0.3);
            box-shadow: none;
            color: white;
        }

        .input-group-text {
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
        }

        .btn-login {
            background: #6f4e37;
            border: none;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: #8b5e3c;
            transform: scale(1.03);
        }

        .tagline {
            font-size: 13px;
            color: #ddd;
            margin-bottom: 25px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="login-card text-center">
    <h3>ORSO COFFEE</h3>
    <div class="tagline">Brewed with Passion ☕</div>

    <form id="loginForm">
        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fa fa-envelope"></i></span>
            <input type="text" id="username" class="form-control" placeholder="Email" required>
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fa fa-lock"></i></span>
            <input type="password" id="password" class="form-control" placeholder="Password" required>
        </div>

        <button type="submit" class="btn btn-login w-100 fw-bold text-white">
            MASUK
        </button>
    </form>

    <div id="msg" class="text-warning mt-3 small"></div>
</div>

<script>
document.getElementById('loginForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const res = await fetch('http://127.0.0.1:8000/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            email: document.getElementById('username').value,
            password: document.getElementById('password').value
        })
    });

    const result = await res.json();
    if (res.ok) {
        const formData = new FormData();
        formData.append('id_user', result.user.id_user);
        formData.append('role', result.user.role);
        formData.append('nama', result.user.nama);

        await fetch('set_session.php', { method: 'POST', body: formData });

        if (result.user.role === 'pemilik') window.location.href = 'dashboard_owner.php';
        else if (result.user.role === 'kasir') window.location.href = 'dashboard_kasir.php';
    } else {
        document.getElementById('msg').innerText = "Email atau Password salah!";
    }
});
</script>

</body>
</html>