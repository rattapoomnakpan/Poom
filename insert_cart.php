<?php 
session_start();
include('connection/connection.php');

// ตรวจสอบและตั้งค่า default ให้กับข้อมูล
$cusname_firstname = $_POST['firstname'] ?? '';
$cusname_lastname = $_POST['lastname'] ?? '';
$cusAddress = $_POST['address'] ?? '';
$cusTel = $_POST['phone'] ?? '';
$cusemail = $_POST['email'] ?? '';
$LINE = $_POST['LINE'] ?? '';
$total_price = $_POST['total_price'] ?? $_SESSION["sum_price"] ?? 0; // ตั้งค่าเริ่มต้นเป็น 0 หากไม่มีค่า

// ตรวจสอบการเชื่อมต่อฐานข้อมูล
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

// เพิ่มข้อมูลลงใน tb_order
$sql = "INSERT INTO tb_order (
    firstname, 
    lastname, 
    address, 
    telephone, 
    email, 
    LINE, 
    total_price, 
    order_status
) VALUES (
    '$cusname_firstname', 
    '$cusname_lastname', 
    '$cusAddress', 
    '$cusTel', 
    '$cusemail', 
    '$LINE', 
    '$total_price', 
    '1'
)";
if (!mysqli_query($connection, $sql)) {
    die("Error inserting into tb_order: " . mysqli_error($connection));
}

$orderID = mysqli_insert_id($connection);
$_SESSION["order_id"] = $orderID;

// วนลูปข้อมูลสินค้า
for ($i = 0; $i <= (int) $_SESSION["intLine"]; $i++) {
    if (isset($_SESSION["strProductID"][$i]) && $_SESSION["strProductID"][$i] != "") {
        $pro_id = $_SESSION["strProductID"][$i];

        // ดึงข้อมูลสินค้า
        $sql1 = "SELECT * FROM tb_product WHERE id = '$pro_id'";
        $result1 = mysqli_query($connection, $sql1);
        $row_pro = mysqli_fetch_assoc($result1);

        $orderPrice = $row_pro['price'];
        $orderQty = $_SESSION["strQty"][$i];
        $Total = $orderQty * $orderPrice;

        // เพิ่มข้อมูลลงใน order_detail
        $sql2 = "INSERT INTO order_detail (
            orderID, 
            pro_id, 
            orderPrice, 
            orderQty, 
            Total
        ) VALUES (
            '$orderID', 
            '$pro_id', 
            '$orderPrice', 
            '$orderQty', 
            '$Total'
        )";
        mysqli_query($connection, $sql2);
    }
}

// ปิดการเชื่อมต่อฐานข้อมูล
mysqli_close($connection);

// ล้าง session และทำลาย session
unset($_SESSION['intLine']);
unset($_SESSION['strProductID']);
unset($_SESSION['strQty']);
unset($_SESSION['sum_price']);

// แจ้งเตือนการบันทึกข้อมูลสำเร็จ
echo "
    <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            Swal.fire({
                icon: 'success',
                title: 'บันทึกข้อมูลเรียบร้อยแล้ว',
                text: 'ยินดีต้อนรับ!',
                showConfirmButton: false,
                timer: 1500,
                background: '#4BB543',
                color: '#fff',
                timerProgressBar: true
            }).then(function() {
                window.location.href = 'print_order.php';
            });
        });
    </script>
";
exit();
?>
