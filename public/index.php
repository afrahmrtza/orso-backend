<?php
use App\Controllers\UserController;
use App\Controllers\MenuController;
use App\Controllers\OrderController;
use App\Controllers\TestimoniController;
use App\Controllers\ReportController;
use App\Middleware\RoleMiddleware;
use Slim\Factory\AppFactory;
use Slim\Views\Twig;
use Slim\Views\TwigMiddleware;
use App\Controllers\AdminController;

require __DIR__ . '/../vendor/autoload.php';

$app = AppFactory::create();

// Agar Slim mengenali _METHOD: PUT saat menggunakan POST (Spoofing)
$app->add(\Slim\Middleware\MethodOverrideMiddleware::class); 

// 1. MIDDLEWARE UTAMA
$app->addRoutingMiddleware(); 
$app->addBodyParsingMiddleware(); 
$app->addErrorMiddleware(true, true, true); 

// 2. MIDDLEWARE CORS
$app->add(function ($request, $handler) {
    $response = $handler->handle($request);
    return $response
        ->withHeader('Access-Control-Allow-Origin', '*') 
        ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization, X-Role')
        ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});

// 3. RUTE UMUM 
$app->post('/users/register', UserController::class . ':register');
$app->post('/auth/login', UserController::class . ':login');
$app->get('/menu', MenuController::class . ':getAll'); 
$app->get('/testimoni', TestimoniController::class . ':getApproved'); 
$app->get('/users', UserController::class . ':getAllUsers'); 
$app->put('/users/{id}', UserController::class . ':updateUser'); 
$app->delete('/users/{id}', UserController::class . ':deleteUser'); 

// 4. RUTE PELANGGAN (Wajib Login, Header X-Role: pelanggan/kasir/pemilik)
$app->group('', function ($group) {
    $group->post('/order', OrderController::class . ':createOrder'); // Buat pesanan baru
    $group->post('/testimoni', TestimoniController::class . ':create'); // Kirim ulasan baru
})->add(new RoleMiddleware(['pelanggan', 'kasir', 'pemilik']));

// 5. RUTE KASIR (Wajib Header X-Role: kasir/pemilik)
$app->group('/kasir', function ($group) {
    $group->get('/orders', OrderController::class . ':getAllOrders');
    $group->get('/order/{id}', OrderController::class . ':getOrderDetail');
    $group->put('/order/{id}/status', OrderController::class . ':updateStatus');
})->add(new RoleMiddleware(['kasir', 'pemilik']));

// 6. RUTE OWNER (Wajib Header X-Role: pemilik)
$app->group('/owner', function ($group) {
    // Laporan
    $group->get('/laporan/harian', ReportController::class . ':dailyReport');
    $group->get('/laporan/bulanan', ReportController::class . ':monthlyReport');

    // Manajemen Menu (URL: /owner/menu)
    $group->post('/menu', MenuController::class . ':create'); // Tambah menu
    
    // Gunakan MAP agar bisa terima PUT asli maupun POST (Spoofing)
    $group->map(['PUT', 'POST'], '/menu/{id}', MenuController::class . ':update');
    
    $group->delete('/menu/{id}', MenuController::class . ':delete'); // Hapus menu

    // Moderasi Testimoni
    $group->put('/testimoni/{id}/approve', TestimoniController::class . ':approve'); // Setujui ulasan
    $group->delete('/testimoni/{id}', TestimoniController::class . ':delete'); // Hapus ulasan
})->add(new RoleMiddleware(['pemilik']));

// 7. WEBHOOK PAYMENT (Otomatis dari Midtrans)
$app->post('/payment/notification', \App\Controllers\MidtransHandler::class . ':handleNotification');

// Konfigurasi Twig
$twig = Twig::create(__DIR__ . '/../src/Views', ['cache' => false]);
$app->add(TwigMiddleware::create($app, $twig));

// Grup Rute Admin
$app->group('/admin', function ($group) {
    $group->get('/dashboard', AdminController::class . ':index');
    $group->get('/menu', AdminController::class . ':listMenu');
    $group->get('/testimoni', AdminController::class . ':listTestimoni');
    $group->post('/order/update', AdminController::class . ':updateStatus');
});

$app->post('/notification/handling', \App\Controllers\MidtransController::class . ':handleNotification');

// Rute untuk melihat riwayat pesanan berdasarkan ID User
$app->get('/orders/user/{id_user}', \App\Controllers\OrderController::class . ':getCustomerOrders');
$app->get('/orders/detail/{id}', \App\Controllers\OrderController::class . ':getOrderDetail');

// Rute cek pesanan per tanggal
$app->get('/admin/orders/date/{date}', \App\Controllers\OrderController::class . ':getOrdersByDate');

// Rute Dashboard Admin
$app->get('/admin/orders', \App\Controllers\OrderController::class . ':getAllOrders');
$app->put('/admin/orders/complete/{id}', \App\Controllers\OrderController::class . ':updateStatusSelesai');

// Laporan & Testimoni
$app->get('/admin/reports', \App\Controllers\OrderController::class . ':getReports');
$app->put('/admin/testimoni/approve/{id}', \App\Controllers\TestimoniController::class . ':approveTestimoni');
$app->get('/owner/testimoni', [TestimoniController::class, 'getAll']);

// Rute Update Profile
$app->put('/users/update/{id}', \App\Controllers\UserController::class . ':updateProfile');

$app->run();