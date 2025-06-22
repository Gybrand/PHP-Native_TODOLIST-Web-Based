<?php

include 'function/modal/add_user_modal.php';
include 'function/modal/edit_user_modal.php';
?>

<!-- Include Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- Sidebar -->
<div id="sidebar" style="display: none;">
    <!-- Tombol Arrow Left di sidebar -->
    <button type="button" id="closeSidebar" class="btn btn-secondary">
        <i class="fas fa-arrow-left"></i> <!-- Ikon Arrow Left -->
    </button>

    <h4>Kerjaan TO-DO LIST</h4>
    <hr>
    
    <a href="../../../kerjaan_todolist/index.php" class="btn btn-primary mb-4 btn-lg">Dashboard</a>
    <a href="../../../kerjaan_todolist/page_tambah_kerjaan.php" class="btn btn-primary">Tambah Kerjaan</a>

    <!-- Dynamically Generated Buttons -->
    <?php
    include 'config.php';

    // Query to fetch all users
    $query = "SELECT nipp, nama FROM userdata";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $nipp = htmlspecialchars($row['nipp']);
            $nama = htmlspecialchars($row['nama']);
            echo '
            <div class="d-flex justify-content-center">
                <a href="pekerjaan.php?nipp=' . urlencode($nipp) . '" 
                   class="btn btn-light text-primary w-100 text-start px-3">
                   <div class="fw-bold"><i class="fas fa-user"></i>'. '     '. $nipp . '</div>
                   <div class="text-muted"><i class="fas fa-angle-right"></i>'. '     '.  $nama . '</div>
                </a>
            </div>';  
        }
    }
    
    ?>
    <br>

    <div class="d-flex justify-content-center">
        <button onclick="toggleUserOptions()" class="btn btn-warning active float-center">
            <i class="fas fa-cog"></i> Setting
        </button>
    </div>

    <div id="userOptions" style="display: none; margin-top: 10px;">
        <div class="d-flex justify-content-center mb-2">
            <!-- Add User Button -->
            <button class="btn btn-success float-start me-2" data-bs-toggle="modal" data-bs-target="#addUserModal">
                Add User
            </button>

            <!-- Edit User Button -->
            <button class="btn btn-primary float-start" data-bs-toggle="modal" data-bs-target="#editUserModal"
                onclick="setEditUser('<?php echo $nipp; ?>', '<?php echo $nama; ?>')">
                Edit User
            </button>

        </div>
        <div class="d-flex justify-content-center mb-2">
            <!-- Tombol Delete User -->
            <button class="btn btn-danger float-center" onclick="deleteUser()">
                Delete User
            </button>
        </div>
        
    </div>
        <!-- Login as Admin section -->
        <div id="adminLoginSection" style="position: absolute; bottom: 0; width: 85%; padding: 10px 0;">
        <?php if (isset($_SESSION['admin_logged_in']) && $_SESSION['admin_logged_in']): ?>
            <p class="text-center fw-bold">Login as Admin</p>
            <p class="text-center">NIPP: <?= htmlspecialchars($_SESSION['admin_nipp']); ?></p>
            <a href="auth/admin_logout.php" class="btn btn-danger btn-sm">Logout</a>
        <?php else: ?>
            <a href="auth/admin_login.php" class="btn btn-primary btn-sm">Login Admin</a>
            <!-- <a href="admin_register.php" class="btn btn-secondary btn-sm">Register Admin</a> -->
        <?php endif; ?>
    </div>
</div>

<script>
    // JavaScript function to toggle the visibility of user management options
function toggleUserOptions() {
    const userOptions = document.getElementById("userOptions");
    // Toggle visibility
    if (userOptions.style.display === "none") {
        userOptions.style.display = "block"; // Show Add and Edit User buttons
    } else {
        userOptions.style.display = "none"; // Hide Add and Edit User buttons
    }
}
// Function to get query parameter from the URL
function getQueryParam(param) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(param);
}

// Function to populate the modal with user data
function populateUserDataFromURL() {
    const nipp = getQueryParam('nipp'); // Get the 'nipp' from the URL

    if (nipp) {
        // Fetch the user data from the server based on 'nipp'
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'get_user_data.php?nipp=' + nipp, true);
        xhr.onload = function() {
            if (xhr.status === 200) {
                const user = JSON.parse(xhr.responseText);
                if (user) {
                    // Populate the modal fields with the user data
                    document.getElementById('editNipp').value = user.nipp; // Read-only
                    document.getElementById('editNama').value = user.nama; // Editable
                }
            } else {
                console.log('Error fetching user data');
            }
        };
        xhr.send();
    }
}

// Call the function when the page loads to pre-populate the modal
window.onload = populateUserDataFromURL;

// Function to delete user data
function deleteUser() {
    const nipp = getQueryParam('nipp'); // Mendapatkan NIPP dari URL

    if (nipp && confirm("Are you sure you want to delete this user and their related pekerjaan?")) {
        // Create an XMLHttpRequest to delete the user and pekerjaan
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'function/delete/delete_user.php?nipp=' + nipp, true);
        xhr.onload = function() {
            if (xhr.status === 200) {
                // Handle successful deletion (e.g., show a message or refresh the list)
                alert(xhr.responseText); // You can show a success message here
                window.location.href = "index.php"; // Redirect to a different page or refresh
            } else {
                console.log('Error deleting user');
            }
        };
        xhr.send();
    }
}
         
</script>