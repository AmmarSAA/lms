<?php

/********************************
* File Name: feedback_list.php 		*
* Author: Ammar S.A.A 			*
* Output: feedbacks & Regulations 	*
********************************/

require('config.php');
require(WEBSITE_PATH.'./includes/db_connection.php');
require(WEBSITE_PATH.'./includes/session.php');
include(WEBSITE_PATH.'./includes/header.php');
include(WEBSITE_PATH.'./includes/logo.php');
include(WEBSITE_PATH.'./includes/menu.php');

if(isset($_GET['action']) && isset($_GET['id']))
{
	$id = $_GET['id'];
	$sql = "DELETE FROM tblfeedback WHERE id={$id}";
	$result = $conn->query($sql);
	if($result)
	{
		$msg = "<div class='alert alert-success'>Record Deleted Successfully.</div>";
	}
	else{
		$msg = "<div class='alert alert-danger'>Record Not Deleted Successfully.</div>";
	}

}
	$sql="SELECT
			tblfeedback.id,
			tblfeedback.feedback,
			tblfeedback.feedback_urdu,
			tblfeedback.feedback_reply,
			tblfeedback.rating,
			admin.user_name,
			tblusers.full_name,
			tblusers.email_id,
			tblfeedback.creation_date,
			tblfeedback.reply_date
		FROM
			tblfeedback
		INNER JOIN tblusers ON tblfeedback.user_id = tblusers.id
		INNER JOIN admin ON tblfeedback.reply_id = admin.id
		ORDER BY id DESC";
if(isset($_POST['search']) && !empty($_POST['search'])){
	$search = trim($_POST['search']);
	$sql= "SELECT
			tblfeedback.id,
			tblfeedback.feedback,
			tblfeedback.feedback_urdu,
			tblfeedback.feedback_reply,
			tblfeedback.rating,
			admin.user_name,
			tblusers.full_name,
			tblusers.email_id,
			tblfeedback.creation_date,
			tblfeedback.reply_date
		FROM
			tblfeedback
		INNER JOIN tblusers ON tblfeedback.user_id = tblusers.id
		INNER JOIN admin ON tblfeedback.reply_id = admin.id
		WHERE 	feedback  			LIKE  	'%{$search}%'
		OR 		feedback_urdu 		LIKE 	'%{$search}%'
		OR 		rating 				LIKE 	'%{$search}%'
		OR 		tblusers.full_name 	LIKE 	'%{$search}%'
		OR 		tblusers.email_id 	LIKE 	'%{$search}%'
		OR 		admin.user_name 	LIKE 	'%{$search}%'
		OR 		creation_date 		LIKE 	'%{$search}%'
		OR 		reply_date 			LIKE 	'%{$search}%'
		";
}

$result = $conn->query($sql);

if (isset($msg))
{
	echo $msg;
}

$row='';
$read_more = '';

if (isset($_GET['read_more'])) {
	$id = $_GET['read_more'];
	$sql= "SELECT
            tblfeedback.id,
            tblfeedback.feedback,
            tblfeedback.feedback_urdu,
            tblfeedback.feedback_reply,
            tblfeedback.rating,
            admin.user_name,
            tblusers.full_name,
            tblusers.email_id,
            tblfeedback.creation_date,
            tblfeedback.reply_date
        FROM
            tblfeedback
        INNER JOIN tblusers ON tblfeedback.user_id = tblusers.id
        INNER JOIN admin ON tblfeedback.reply_id = admin.id
		#ORDER BY id DESC
		WHERE tblfeedback.id={$id}";
    $result = $conn->query($sql);
    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $id             = $row['id'];
        $feedback       = $row['feedback'];
        $feedback_urdu  = $row['feedback_urdu'];
        $rating         = $row['rating'];
        $replied_by     = $row['user_name'];
        $reply          = $row['feedback_reply'];
        $admin_name     = $row['user_name'];
        $user_name      = $row['full_name'];
        $user_email     = $row['email_id'];
        $creation_date  = $row['creation_date'];
        $reply_date     = $row['reply_date'];
    };
}

?>
<?php 
if (!IfIsUser($conn) && $_SESSION['user_name']) {
?>
			    <section id="content">
					<div class="page-wrapper">
						<div class="container-fluid">
							<div class="row">
								<div class="col-12">
									<!--Search Nav Start-->
									<nav class="navbar navbar-light default-color bg-transparent nav justify-content-between">
  										<a class="navbar-brand" href="feedback_list.php">Feedbacks' List</a>
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
									</nav>
									<!--Search Nav End-->
								</div>
							</div>
							<div class="row">
								<div class="table-responsive">
									<table class="table table-borderless table-condensed table-hover table-striped">
										<thead class="thead thead-light">
											<tr>
												<th class="text-nowrap">ID</th>
												<th class="text-nowrap">Feedback</th>
												<th class="text-nowrap urdu">رائے</th>
												<th class="text-nowrap">Reply</th>
												<th class="text-nowrap">Stars</th>
												<th class="text-nowrap">Full Name</th>
												<th class="text-nowrap">Email ID</th>
												<th class="text-nowrap">Creation Date</th>
												<th class="text-nowrap">Reply Date</th>
												<th class="text-nowrap">Replied By</th>
												<th colspan="2" class="text-nowrap">Action</th>
											</tr>
										</thead>
										<tbody>
											<?php 
											
											if ($result){
											foreach ($result as $row) {
											
											?>
											<tr>
												<td><?php echo $row['id']; ?></td>
												<!--Feedback-->
												<td class="text-truncate">
												<?php
												
													if (isset($_GET['read_more'])) {
														echo $row['feedback'];
													}else{
														echo substr($row['feedback'],0,20);
														if(!empty($row['feedback'])){ 
												
												?>
												
													<a href="<?php echo WEBSITE_URL.'feedback_list.php?read_more='.$row['id']; ?>">...Read More</a>
												
												<?php }} ?>	
												</td>
												<!--Feedback Urdu-->
												<td class="urdu text-truncate">
												<?php 
													
													if (isset($_GET['read_more'])) {
														echo $row['feedback_urdu'];
													}else{
														echo substr($row['feedback_urdu'],0,10);
														if(!empty($row['feedback_urdu'])){
												
												?>
												
													<a href="<?php echo WEBSITE_URL.'feedback_list.php?read_more='.$row['id']; ?>">...مزید پڑھیں</a>
												
												<?php }} ?>
												</td>
												<!--Reply-->
												<td class="text-truncate">
												<?php
												
													if (isset($_GET['read_more'])) {
														echo $row['feedback_reply'];
													}else{
														echo substr($row['feedback_reply'],0,20);
														if(!empty($row['feedback_reply'])){ 
												
												?>
												
													<a href="<?php echo WEBSITE_URL.'feedback_list.php?read_more='.$row['id']; ?>">...Read More</a>
												<?php }} ?>	
												</td>
												<td>
													<?php 
													if (isset($row['rating'])) {
														GetStars($row['rating']);
													}else{ echo "Not Rated!";}?>
												</td>
												<td><?php echo $row['full_name']; ?></td>
												<!--email ID-->
												<td class="text-truncate">
												<?php
												
													if (isset($_GET['read_more'])) {
														echo $row['email_id'];
													}else{
														echo substr($row['email_id'],0,8);
														if(!empty($row['email_id'])){ 
												
												?>
												
													<a href="<?php echo WEBSITE_URL.'feedback_list.php?read_more='.$row['id']; ?>">...</a>
												
												<?php }} ?>	
												</td>
												<td><?php echo $row['creation_date']; ?></td>
												<td><?php echo $row['reply_date']; ?></td>
												<td><?php echo $row['user_name']; ?></td>
												<td>
													<button role="button" class="btn btn-info btn-sm">
														<a class="" href="<?php echo WEBSITE_URL.'feedback.php?action=relpy&id='.$row['id']; ?>">
															<i class="fa fa-envelope-o fa-lg"></i>
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
													echo "<tr><td colspan='12'><p>No record found for <b>{$search}</b></p></td></tr>";
												}
											?>
										</tbody>
										<tfoot class="tfoot tfoot-light">
											<tr>
												<td colspan="12">
													<?php
														if (isset($search)) {
															GetTotalSearchResult($conn,$result,$search);
														}else{
															$total_feedbacks = GetTotal($conn, TBLFEEDBACK);
															echo "Showing total <b>".$total_feedbacks."</b> of <b>".$total_feedbacks."</b> ";
															if ($total_feedbacks > 1) {
																echo "results.";
															}else{ echo "result.";}
														}	
													?>
												</td>
											</tr>
										</tfoot>
									</table>
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
		<br />

<script>
function delete_confirm(id) 
{
	var txt;
		if (confirm("Are you sure? you want to delete this record.")) {
			window.location.href = "<?php echo WEBSITE_URL. 'feedback_list.php?action=delete&id=' ?>"+id;
		}
}
</script>

<?php 
	include(WEBSITE_PATH.'./includes/footer.php');
?>