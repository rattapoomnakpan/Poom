<?php 
include('connection/connection.php');
session_start();

// Query product
$sql = "SELECT 
            tb_product.id AS product_id, 
            tb_product.title, 
            tb_product.image, 
            tb_product.price, 
            tb_product.detail,
            tb_type_product.title AS type_title 
        FROM tb_product 
        LEFT JOIN tb_type_product 
        ON tb_product.type_product_id = tb_type_product.id";

$query_product = mysqli_query($connection,$sql);
if(isset($_GET['id']) && !empty($_GET['id'])){
    $id = $_GET['id'];

    $sql_view = "UPDATE tb_product SET view = view+1 WHERE id = '$id'";
    $query_view = mysqli_query($connection,$sql_view);
    // เรีกยข้อมูลรายการสินค้าอื่นๆ ที่ไม่ใช้ id ที่ส่งมา
    $sql_product = $sql." WHERE tb_product.id != '$id' ORDER BY tb_product.id DESC LIMIT 4";
    $query_product = mysqli_query($connection, $sql_product);


    //เรียกข้อมูลสินค้าจาก id ที่ส่งมา
    $sql .= " WHERE tb_product.id = '$id'";

}
$query = mysqli_query($connection, $sql);
$result = mysqli_fetch_assoc($query);
//รายการสินค้าแนะนำ
$sql .= " ORDER BY view DESC LIMIT 3";
$query_recommend = mysqli_query($connection,$sql)
?>
<!DOCTYPE html>
<html lang="en">
<?php include('includes/head.php'); ?>

<body>

<?php include('includes/loader.php'); ?>
<?php include('includes/navbar/navbarindex.php'); ?>

<!-- Slide-banner -->
<?php include('includes/silde-baner.php'); ?>


 <style>
    /* General Styling */
.collection {
  padding: 2rem 0;
  background-color: #f8f8f8;
}

.collection-list {
  display: flex;
  flex-wrap: wrap; /* ทำให้รายการไปยังบรรทัดถัดไปถ้าพื้นที่ไม่พอ */
  gap: 2rem;
  justify-content: center;
  list-style: none;
  padding: 0;
  margin: 0;
}

.collection-card {
  position: relative;
  width: 21rem;
  height: 21rem;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  align-items: center;
  padding: 2rem;
  background-size: cover;
  background-position: center;
  border-radius: 1rem;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.collection-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
}

.card-title {
  font-size: 1rem;
  font-weight: 700;
  color: #fff;
  margin-bottom: 1rem;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
}

.btn-secondary {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.8rem 1.5rem;
  font-size: 1rem;
  font-weight: 600;
  color: #000;
  background-color: #fff;
  border-radius: 2rem;
  text-decoration: none;
  transition: background-color 0.3s ease, transform 0.3s ease;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.btn-secondary:hover {
  background-color: #f0c14b;
  transform: translateY(-5px);
}

.btn-secondary ion-icon {
  font-size: 1.8rem;
}

 </style>



 <section class="section collection">
        <div class="container">

          <ul class="collection-list has-scrollbar">

            <li>
              <div class="collection-card" style="background-image: url('./upload/MSI CYBORG 14 A13VF-064TH.jpg')">
                <h3 class="h4 card-title"> MSI VECTOR 17 HX A14VHG-613TH</h3>

                <a href="http://localhost/htdocs/Project_END/%e0%b9%80%e0%b8%ad%e0%b8%b2%e0%b8%88%e0%b8%a3%e0%b8%b4%e0%b8%87/catalog/product-detail.php?id=4" class="btn btn-secondary">
                  <span>Shop</span>

                  <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                </a>
              </div>
            </li>

            <li>
              <div class="collection-card" style="background-image: url('./upload/MSI STEALTH 16 MERCEDES-AMG.jpg')">
                <h3 class="h4 card-title">MSI STEALTH 16 MERCEDES-AMG</h3>

                <a href="http://localhost/htdocs/Project_END/%e0%b9%80%e0%b8%ad%e0%b8%b2%e0%b8%88%e0%b8%a3%e0%b8%b4%e0%b8%87/catalog/product-detail.php?id=1" class="btn btn-secondary">
                  <span>Shop</span>

                  <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                </a>
              </div>
            </li>

            <li>
              <div class="collection-card" style="background-image: url('./upload/ACER NITRO V 15 ANV15-41-R1R0.jpg')">
                <h3 class="h4 card-title">ACER NITRO V 15 ANV15-41-R1R0</h3>

                <a href="http://localhost/htdocs/Project_END/%e0%b9%80%e0%b8%ad%e0%b8%b2%e0%b8%88%e0%b8%a3%e0%b8%b4%e0%b8%87/catalog/product-detail.php?id=10" class="btn btn-secondary">
                  <span>Shop</span>

                  <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                </a>
              </div>
            </li>
      

          </ul>

        </div>
      </section>



<!-- Product types -->
 <div class="container my-5 text-center">
 <div class="container my-5 text-center">
    <h1>รายการสินค้า</h1>
</div>
<div class="row mt-5">
    <?php 
    $counter = 0;  // ตั้งตัวแปรนับสินค้า
    foreach ($query_product as $product): 
        if ($counter >= 6) break;  // หยุดแสดงหลังจากสินค้าครบ 6 ชิ้น
    ?>
        <div class="col-12 col-md-4 col-lg-4 p-4">
            <div class="card mt-2" style="width: 18rem;">
                <img src="admin/upload/product/<?=$product['image']?>" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title" style="color:#000;"><?= $product['title'] ?></h5>
                    <p class="card-text">ประเภท : <?= htmlspecialchars($product['type_title']) ?></p>
                    <p class="card-text">ราคา : <?= number_format($product['price']) ?> บาท</p>
                    <center class="mt-2">
                        <a href="product-detail.php?id=<?=$product['product_id']?>" class="btn btn-dark">ดูลายละเอียด</a>
                    </center>
                </div>
            </div>
        </div>
        <?php $counter++; // เพิ่มค่าตัวนับสินค้า ?>
    <?php endforeach; ?>
</div>

 </div>



<!-- footer -->
<?php include('includes/footer.php'); ?>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
