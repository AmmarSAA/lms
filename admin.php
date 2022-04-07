<?php

/****************************
* File Name: admin.php 		*
* Author: Ammar S.A.A 		*
* Output: List of Admins 	*
****************************/

require('config.php');
require(WEBSITE_PATH.'./includes/db_connection.php');
require(WEBSITE_PATH.'./includes/session.php');
include(WEBSITE_PATH.'./includes/header.php');
include(WEBSITE_PATH.'./includes/logo.php');
include(WEBSITE_PATH.'./includes/menu.php');


if(isset($_GET['action']) && isset($_GET['id']))
{
	$id = $_GET['id'];
	$sql = "DELETE FROM admin WHERE id={$id}";
	$result = $conn->query($sql);
	if($result)
	{
		$msg = "<div class='alert alert-success'>Record Deleted Seccessfully.</div>";
	}
	else{
		$msg = "<div class='alert alert-danger'>Record Not Deleted Seccessfully.</div>";
	}

}
$sql = "SELECT * FROM admin
			ORDER BY id DESC";
if(isset($_POST['search']) && !empty($_POST['search'])){
	$search = trim($_POST['search']);
	$sql="SELECT * FROM admin 
		WHERE full_name LIKE '%{$search}%'
		OR admin_email 	LIKE '%{$search}%'
		OR user_name 	LIKE '%{$search}%'
		OR status 		LIKE '%{$search}%'
		";
}
$result = $conn->query($sql);

if (isset($msg))
{
	echo $msg;
}
?>     							
<?php 
if (!IfIsUser($conn) && $_SESSION['user_name'] == "Ammar S.A.A" || $_SESSION['user_name'] == "admin" || $_SESSION['user_name'] == "root" ) {
?>
			<section id="content">
				<div class="page-wrapper">
					<div class="container-fluid">
						<div class="row">
							<div class="col md-8 lg-10 sm-6">
								<!--Search Nav Start-->
								<nav class="navbar navbar-light default-color bg-transparent nav justify-content-between">
  									<a class="navbar-brand" href="admin.php">Admins' List</a>
  									<!--Search Form Start-->
  									<form class="form-inline form-responsive my-0 form-inline bg-transparent" method="POST">
    									<div class="md-form form-sm my-0">
      										<input type="text" class="form-control" name="search" placeholder="Search..." />
    										<button class="btn btn-sm my-0 btn-transparent" type="submit">
   												<i class="material-icons">search</i>
  											</button>
  										</div>
  									</form>
									<!--Search Form End-->
									<div class="btn btn-group">
									    <a class="btn btn-outline-primary" href="user-signup.php" role="button">Add User</a>
									    <a class="btn btn-outline-primary" href="admin-signup.php" role="button">Add Admin</a>
								    </div>
								</nav>
								<!--Search Nav End-->
							</div>
						</div>
						<div class="row">
							<div class="table-responsive">
								<table class="table table-hover table-striped">
									<thead class="thead thead-light">
										<tr>
											<th class="text-nowrap">ID</th>
											<th class="text-nowrap">Full Name</th>
											<th class="text-nowrap">E-Mail</th>
											<th class="text-nowrap">Admin Name</th>
											<th class="text-nowrap">Password</th>
											<th class="text-nowrap">Reg. Date</th>
											<th class="text-nowrap">Updt. Date</th>
											<th class="text-nowrap">Status</th>
											<th class="text-nowrap">Profile Picture</th>
											<th colspan="2">Action</th>
										</tr>
									</thead>
									<tbody>
										<?php

										if ($result){
										foreach ($result as $row) {
										
										?>
										<tr>
											<td><?php echo $row['id']; ?></td>
											<td><?php echo $row['full_name']; ?></td>
											<td><?php echo $row['admin_email']; ?></td>
											<td><?php echo $row['user_name']; ?></td>
											<td><?php echo $row['password']; ?></td>
											<td><?php echo $row['reg_date']; ?></td>
											<td><?php echo $row['updation_date']; ?></td>
											<td><?php echo $row['status']; ?></td>
											<td class="img">
												<?php 
												if(empty($row['profile_picture']))
												{												
													echo "<p class='initialism text-center'>No Profile<br/>Picture</p>"; 
												}
												else{
													echo "<img width='55in' class='img-responsive img-circle' src='".WEBSITE_URL."./images/profile_pictures/".$row['profile_picture']."'/>"; 
												}
												?>
											</td>
											<td>
												<button role="button" class="btn btn-warning btn-sm">
													<a href="<?php echo WEBSITE_URL. 'slide_add.php?id='.$row['id']; ?> ">
														<i class="display-5 glyphicon glyphicon-edit"></i>
													</a>
												</button>
											</td>
											<td>
												<button class="btn btn-danger btn-sm" onclick="delete_confirm(<?php echo $row["id"]; ?>)" >
													<i class="display-5 glyphicon glyphicon-trash"></i>
												</button>
											</td>
										</tr>
										<?php }
											}else{
												echo "<tr><td colspan='11'><p>No record found for <b>{$search}</b></p></td></tr>";
											}
										?>
									</tbody>
								</table>
								<div>
									<p>
										<?php
											
											if (isset($search)) {	
											
												GetTotalSearchResult($conn,$result,$search);
											
											}else{
											
												$total_admins = GetTotal($conn, TBLADMIN);
												echo "Showing total <b>".$total_admins."</b> of <b>".$total_admins."</b> ";
												if ($total_admins > 1) {
													echo "results.";
												}else{ echo "result.";}
											
											}

										?>
									</p>
								</div>
							</div>
						</div>
						<br />
					</div>
				</div>
			</section>
			<?php 
				}else{ echo "<div class='alert alert-danger'>Access Denied!</div>"; }
			?>
		</div>
	</div>
<script>
function delete_confirm(id) {
  var txt;
  if (confirm("Are you sure? you want to delete this record.")) {
   window.location.href = "<?php echo WEBSITE_URL. 'admin.php?action=delete&id=' ?>"+id;
  }
}
</script>

<?php 
include(WEBSITE_PATH.'./includes/footer.php');
?>