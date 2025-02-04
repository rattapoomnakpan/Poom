<?php 
include('connection/connection.php');
session_start();

// Query type product
$sql_type_product = "SELECT * FROM tb_type_product";
$query_type_product = mysqli_query($connection, $sql_type_product);

if (!$query_type_product) {
    die("SQL Error (Type Product): " . mysqli_error($connection));
}

// ตั้งค่าหน้าปัจจุบัน
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$record_show = 999; // จำนวนข้อมูลที่จะแสดง
$offset = ($page - 1) * $record_show; // เลขเริ่มต้น

// Query Total Product
$sql_total = "SELECT * FROM tb_product";
$query_total = mysqli_query($connection, $sql_total);
if (!$query_total) {
    die("SQL Error (Total Product): " . mysqli_error($connection));
}
$row_total = mysqli_num_rows($query_total);
$page_total = ceil($row_total / $record_show);

// Query Product ตามประเภทหรือชื่อสินค้า
$sql = "SELECT 
            tb_product.id AS product_id, 
            tb_product.title, 
            tb_product.image, 
            tb_product.price, 
            tb_product.detail,
            tb_type_product.title AS type_title 
        FROM tb_product 
        LEFT JOIN tb_type_product 
        ON tb_product.type_product_id = tb_type_product.id 
        WHERE 1=1"; // ใช้ WHERE 1=1 เพื่อเพิ่มเงื่อนไขง่ายขึ้น

// กรองสินค้าตามประเภท
if (isset($_GET['type_product_id']) && !empty($_GET['type_product_id'])) {
    $type_product_id = mysqli_real_escape_string($connection, $_GET['type_product_id']);
    $sql .= " AND tb_product.type_product_id = '$type_product_id'";
}

// กรองสินค้าตามชื่อสินค้า
if (isset($_GET['search']) && !empty($_GET['search'])) {
    $search = mysqli_real_escape_string($connection, $_GET['search']);
    $sql .= " AND tb_product.title LIKE '%$search%'";
}

// เพิ่มการ Query สินค้าตามหน้า
$sql .= " LIMIT $record_show OFFSET $offset";

$query_product = mysqli_query($connection, $sql);

if (!$query_product) {
    die("SQL Error (Product): " . mysqli_error($connection) . "<br>Query: " . $sql);
}

// ตรวจสอบการดึงข้อมูลแบบเดี่ยว
if (isset($_GET['id']) && !empty($_GET['id'])) {
    $id = mysqli_real_escape_string($connection, $_GET['id']);

    // เพิ่มจำนวนการดู
    $sql_view = "UPDATE tb_product SET view = view + 1 WHERE id = '$id'";
    $query_view = mysqli_query($connection, $sql_view);

    if (!$query_view) {
        die("SQL Error (Update View): " . mysqli_error($connection));
    }

    // ดึงข้อมูลสินค้าตาม ID
    $sql_product_by_id = "SELECT 
                              tb_product.id AS product_id, 
                              tb_product.title, 
                              tb_product.image, 
                              tb_product.price, 
                              tb_product.detail,
                              tb_type_product.title AS type_title 
                          FROM tb_product 
                          LEFT JOIN tb_type_product 
                          ON tb_product.type_product_id = tb_type_product.id 
                          WHERE tb_product.id = '$id'";
    $query_product_by_id = mysqli_query($connection, $sql_product_by_id);

    if (!$query_product_by_id) {
        die("SQL Error (Product by ID): " . mysqli_error($connection));
    }

    $result_product_by_id = mysqli_fetch_assoc($query_product_by_id);
}
?>

<!DOCTYPE html>
<html lang="en">
<?php include('includes/head.php'); ?>

<body>

<?php include('includes/navbar/navbarproduct.php'); ?>

<style>
    .Product-types {
        display: flex;
        justify-content: space-between; /* Evenly spaces the items */
        margin-bottom: 2rem; /* Adds space below the navigation */
    }

    .Product-types .nav-item {
        margin-right: 1.5rem; /* Adds space between nav items */
    }

    .card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: scale(1.05); /* Slight zoom effect */
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Add a subtle shadow on hover */
    }

    .card-body {
        padding: 1.25rem; /* Adds padding inside the card */
    }

    .card-title {
        font-size: 1.25rem; /* Slightly larger title */
    }

    .card-text {
        font-size: 1.1rem; /* Price text size */
    }

    .list-group{
        margin-top: 25px;
    }
    .list-group-item{
        width: 300px !important;
        margin-left: -100px ;
        text-align: center;
    }

    .list-group-item:hover{
        background-color: #a78f16;
    }

    .group-item{
        background-color: black;
        color: #fff;
    }

    .group-item:hover {
        background-color: black;
        color: #fff;
    }

    .activd-list-menu-custom{
        background-color: lightgray;
    }
</style>

<div class="container my-5">
    <h1 class="text-center">รายการสินค้า</h1>
    <div class="Product-types">
        <ul class="list-group">
            <li class="list-group-item group-item"><h5>ประเภทสินค้า</h5></li>
            <br>
            <a style="color:black; text-decoration: none !important;" href="product.php">
                <li class="list-group-item <?= !isset($_GET['type_product_id']) ? 'activd-list-menu-custom' : '' ?>">
                    <h5>ทั้งหมด</h5>
                </li>
            </a>
            
            
            <?php foreach ($query_type_product as $data): ?>
                <a style="color:black; text-decoration: none !important;" href="?type_product_id=<?= $data['id'] ?>">
                    <li class="list-group-item <?= isset($_GET['type_product_id']) && $_GET['type_product_id'] == $data['id'] ? 'activd-list-menu-custom' : '' ?>">
                        <h5><?= $data['title'] ?></h5>
                    </li>
                </a>
            <?php endforeach; ?>
        </ul>
        
        <div class="container">
            <div class="row">
                <?php if(mysqli_num_rows($query_product)): ?>
                    <?php foreach ($query_product as $product): ?>
                        <div class="col-12 col-md-4 col-lg-4 p-4">
                            <div class="card" style="width: 18rem;">
                                <img src="admin/upload/product/<?=$product['image']?>" class="card-img-top" alt="Product Image">
                                <div class="card-body">
                                    <h5 class="card-title"><?= $product['title'] ?></h5>
                                    <p class="card-text">ประเภท : <?=($product['type_title']) ?></p>
                                    <p class="card-text">ราคา : <?= number_format($product['price']) ?> บาท</p>
                                    <center>
                                        <a href="product-detail.php?id=<?=$product['product_id']?>" class="btn btn-dark">ดูลายละเอียด</a>
                                    </center>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <div class="col-12 p-4">
                        <center>
                            <div class="card" style="height: 100px; margin-top:40px">
                                <h3 style=" margin-top:30px">ไม่พบสินค้า</h3>
                            </div>
                        </center>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <!-- Pagination -->

</div>

<!-- footer -->
<?php include('includes/footer.php'); ?>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
