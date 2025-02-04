<?php 
session_start();
unset($_SESSION['user_id']);
echo "
<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        Swal.fire({
            icon: 'success',
            title: 'ออกจากระบบสำเร็จ',
            text: '',
            showConfirmButton: false,
            timer: 1500,
            background: '#4BB543',
            color: '#fff',
            timerProgressBar: true
        }).then(function() {
            window.location.href = 'login.php'; 
        });
    });
</script>
";
exit();
?>
