<?php

/********************************
* 	File Name: functions.php  	*
* 	Author: Ammar S.A.A       	*
* 	Output: Functions 			*
* 	Content: Functions for 		*
* 	1 . GetCategories 			*
* 	2 . GetAuthors 				*
* 	3 . GetBooks 				*
* 	4 . GetUsers 				*
* 	5 . IsBookAvailable 		*
* 	6 . IsUserAvailable 		*
* 	7 . GetTotalSearchResult 	*
* 	8 . GetTotal 				*
* 	9 . redirect 				*
* 	10 . IfIsUser 				*
* 	11 . GetReturnStatus 		*
* 	12 . IfExist 				*
* 	13 . GetTotalWhere 			*
* 	14 . IsBookRequested 		*
* 	15 . GetTotalWhereAnd 		*
* 	16 . GetStatus 				*
* 	17 . GetStars 				*
* 	18 . GetDueDate 			*
* 	19 . GetDayFine 			*
* 	20 . GetDamagePageFine 		*
* 	21 . GetExtraFine 			*
* 	22 . GetTotalFine 			*
********************************/

/*
1. Get Catgory List
@Author:	Syed Ammar Ahmed
@Date:		16-Apr-2020
@input:		Database connection
@outout:	Array list of categries 
*/

function GetCategories($conn)
{
	echo $sql = "SELECT id,category_name FROM tblcategory WHERE status='Active'";
	$result = $conn->query($sql);
	return $result;
}

/*
2. Get Author List
@Author:	Syed Ammar Ahmed
@Date:		16-Apr-2020
@input:		Database connection
@outout:	Array list of authors 
*/

function GetAuthors($conn)
{
	echo $sql = "SELECT id,author_name FROM tblauthors";
	$result = $conn->query($sql);
	return $result;
}

/*
3. Get Book List
@Author:	Syed Ammar Ahmed
@Date:		18-Apr-2020
@input:		Database connection
@outout:	Array list of books 
*/

function GetBooks($conn)
{
	echo $sql = "SELECT id,book_name FROM tblbooks";
	$result = $conn->query($sql);
	return $result;
}

/*
4. Get User List
@Author:	Syed Ammar Ahmed
@Date:		18-Apr-2020
@input:		Database connection
@outout:	Array list of users 
*/

function GetUsers($conn)
{
	echo $sql = "SELECT id,full_name FROM tblusers";
	$result = $conn->query($sql);
	return $result;
}

/*
5. Get Is Book Available?
@Author:	Syed Ammar Ahmed
@Date:		23-Apr-2020
@input:		Database connection,Book ID, User ID
@outout:	YES or NO 
*/

function IsBookAvailable($conn,$book_id,$user_id)
{
	// check if book is already issued
	$sql = "SELECT * FROM tblissuedbooksdetail WHERE book_id= {$book_id} AND return_status=0";//0=Issued
	$result = $conn->query($sql);
	if ($result &&  $result->num_rows > 0){
		return false;
	}
	return true;
}

/*
6. Get Is Book Available?
@Author:	Syed Ammar Ahmed
@Date:		23-Apr-2020
@input:		Database connection, User ID
@outout:	YES or NO 
*/

function IsUserAvailable($conn,$user_id)
{
	// check if user has already issued book
	$sql = "SELECT * FROM tblissuedbooksdetail WHERE user_id={$user_id}";
	$result = $conn->query($sql);
	if ($result &&  $result->num_rows > 0){
		$sql = "SELECT * FROM tblissuedbooksdetail WHERE user_id={$user_id} AND return_status=0";
		$result = $conn->query($sql);
		if ($result &&  $result->num_rows > 0){
			$sql = "SELECT * FROM tblissuedbooksdetail WHERE user_id={$user_id} AND return_status=3";
			$result = $conn->query($sql);
			if ($result &&  $result->num_rows > 0){
				return false;
			}
		}
	}
	return true;
}

/*
7. Get Total Of Search Results.
@Author:	Syed Ammar Ahmed
@Date:		7-Jul-2020
@input:		Database connection, Search, Search Result
@outout:	Total no. of Search Results
*/

function GetTotalSearchResult($conn,$result,$search)
{
	$result = mysqli_num_rows($result);
	echo "Found <b>".$search."</b> in <b>".$result."</b> ";
	if ($result = 1) {
		echo "row.";
	}else{ echo "rows.";}											
}

/*
8. Get Total No. Of Record(s) Found In A Table.
@Author:	Syed Ammar Ahmed
@Date:		7-Jul-2020
@input:		Database connection,Tables
@outout:	Total no. of record(s) found in a table
*/

function GetTotal($conn, $tblname)
{
	$sql = "SELECT * FROM $tblname";
    $result = $conn->query($sql);
    $result = mysqli_num_rows($result);

    return  ($result);
}

/*
9. Redirect
@Author:	Syed Ammar Ahmed
@Date:		25-Jul-2020
@input:		Database connection
@outout:	Redirect 
*/

function redirect($location)
{
    header("Location:".WEBSITE_URL. $location);
    exit;
}

/*
10. Get If User?
@Author:	Syed Ammar Ahmed
@Date:		28-Jul-2020
@input:		Database connection
@outout:	YES or NO 
*/

function IfIsUser($conn)
{
	if (isset($_SESSION['user_name'])) {
		$sql = "SELECT * FROM tblusers WHERE user_name = '{$_SESSION['user_name']}' ";
	    $result = $conn->query($sql);
		if ($result &&  $result->num_rows > 0){
			return true;
		}
		return false;
	}
}

/*
11. Get Return Status
@Author:	Syed Ammar Ahmed
@Date:		28-Jul-2020
@input:		Row
@outout:	Return Status in String Format 
*/

function GetReturnStatus($return_status)
{
GLOBAL $row;

	switch ($return_status) {
		case '0':
			return "Issued";
			break;
		case '1':
			return "Returned/Available";
			break;
		case '2':
			return "Right Off/Lost";
			break;
		case '3':
			return "Requested";
			break;
		case '5':
			return "Available";
			break;	

		default:
			return "Available";
			break;
	}

}

/*
12. Get If Exist?
@Author:	Syed Ammar Ahmed
@Date:		28-Jul-2020
@input:		Database connection, Table,
@outout:	YES or NO 
*/

function IfExist($tblname, $column, $value)
{
	GLOBAL $conn;

	$sql = "SELECT * FROM $tblname WHERE $column = '{$value}' ";
    $result = $conn->query($sql);
	if ($result &&  $result->num_rows > 0){
		return true;
	}
	return false;
}

/*
13. Get Total No. Of Record(s) Found In A Table.
@Author:	Syed Ammar Ahmed
@Date:		8-Aug-2020
@input:		Database connection,Table, Column, Col-Value
@outout:	Total no. of record(s) found in a table
*/

function GetTotalWhere($conn, $tblname, $column, $value)
{
	$sql = "SELECT * FROM $tblname WHERE $column='{$value}'";
    $result = $conn->query($sql);
    $result = mysqli_num_rows($result);

    return  ($result);
}

/*
14. Get Is Book Requested?
@Author:	Syed Ammar Ahmed
@Date:		23-Apr-2020
@input:		Database connection,Book ID, User ID
@outout:	YES or NO 
*/

function IsBookRequested($conn,$book_id,$user_id)
{
	// check if book is already issued
	$sql = "SELECT
		    tblissuedbooksdetail.id,
		    tblbooks.book_name,
		    tblusers.full_name,
		    tblissuedbooksdetail.issue_date,
		    tblissuedbooksdetail.due_date,
		    tblissuedbooksdetail.return_date,
		    tblissuedbooksdetail.return_status,
		    tblissuedbooksdetail.fine,
		    tblissuedbooksdetail.comments
		FROM
		    tblissuedbooksdetail
		INNER JOIN tblbooks ON tblissuedbooksdetail.book_id = tblbooks.id
		INNER JOIN tblusers ON tblissuedbooksdetail.user_id = tblusers.id 
		WHERE book_id= {$book_id} AND return_status=3";//3=Requested
	$result = $conn->query($sql);
	if ($result &&  $result->num_rows > 0){
		return false;
	}
	return true;
}


/*
15. Get Total No. Of Record(s) Found In A Table.
@Author:	Syed Ammar Ahmed
@Date:		1-Sep-2020
@input:		Database connection,Table, Column, Col-Value
@outout:	Total no. of record(s) found in a table
*/

function GetTotalWhereAnd($conn, $tblname, $column, $value, $column_and, $value_and)
{
	$sql = "SELECT * FROM $tblname WHERE $column='{$value}' AND $column_and=$value_and";
    $result = $conn->query($sql);
    $result = mysqli_num_rows($result);

    return  ($result);
}

/*
16. Get Status
@Author:	Syed Ammar Ahmed
@Date:		29-Jan-2022
@input:		Row
@outout:	Status in String Format 
*/

function GetStatus($status)
{
GLOBAL $row;

	switch ($status) {
		case '0':
			echo "Inactive";
			break;
		case '1':
			echo "Active";
			break;

		default:
			echo "Error";
			break;
	}

}

/*
17. Get Stars
@Author:	Syed Ammar Ahmed
@Date:		29-Jan-2022
@input:		Row
@outout:	Stars in Int Format 
*/

function GetStars($stars)
{
for ($x = 1; $x <= $stars; $x++) {
  echo "<span class='glyphicon glyphicon-star text-success'></span>";
}
for ($x = 4; $x >= $stars; $x--) {
  echo "<span class='glyphicon glyphicon-star-empty text-danger'></span>";
}
}

/*
18. Get Due Date
@Author:	Syed Ammar Ahmed
@Date:		13-Feb-2022
@input:		Issue Date
@outout:	Due Date 
*/

function GetDueDate($issue_date)
{
//Due days //Maximum Book issuing time
$due_day = 10;

//Add $due_day
date_add($issue_date,date_interval_create_from_date_string($due_day));

//Converting to date
$due_date = date("Y-m-d", $issue_date);

//Returning due date
return date("Y-m-d",$due_date);

}

/*
19. Get Calculate Total Days Fine After Due Date
@Author:	Syed Ammar Ahmed
@Date:		25-Feb-2022
@input:		Book due date
@outout:	Fine of days in Int Format
*/

function GetDayFine($due_date_string)
{

//Setting default timezone
date_default_timezone_set("Asia/Karachi");
//Today's date
$today_date = date("Y-m-d");
//Due date conversion
$due_date = $due_date_string;    
$date = new DateTime($due_date);
//Due date
$now = new DateTime();
//Difference between issue date and due date
$difference = $date->diff($now)->format("%d");
//Checking whether to make fine or not
if ($difference > 10) {
	//Fine Rs. per day
	$fine_per_day = 2;
	//Days applicable for fine
	$fine_days = $difference - 10;
	//Calculating fine
	$fine = $fine_per_day * $fine_days;
	//Total fine
	return $fine;
} else {
	if ($difference < 11) {
		$fine = 0;
	}
	return $fine;
}

}

/*
20. Get Calculate Total Damaged Pages Fine
@Author:	Syed Ammar Ahmed
@Date:		25-Feb-2022
@input:		Book damaged pages
@outout:	Fine of damaged pages in Int Format 
*/

function GetDamagePageFine($damagepage)
{
//Fine per page
$fine = 10;

//Fine calculation
$total_fine = $fine * $damagepage;

//Returning fine
return $total_fine;
}

/*
21. Get Calculate Total Extra Fine By User
@Author:	Syed Ammar Ahmed
@Date:		25-Feb-2022
@input:		Extra Fine
@outout:	Extra Fine in Int Format 
*/

function GetExtraFine($extrafine, $fine_per_extra)
{
//Fine per extra
$fine = $fine_per_extra;

//Fine calculation
$total_fine = $fine * $extrafine;

//Returning fine
return $total_fine;
}

/*
22. Get Calculate Total Extra Fine By User
@Author:	Syed Ammar Ahmed
@Date:		25-Feb-2022
@input:		Extra Fine
@outout:	Extra Fine in Int Format 
*/

function GetTotalFine($dayfine, $damagedpagefine, $extrafine)
{
echo $dayfine;
//Fine calculation
$total_fine = $dayfine + $damagedpagefine + $extrafine;

//Returning fine
return $total_fine;
}

/*
23. Check If Session started.
@Author:	Syed Ammar Ahmed
@Date:		14-Oct-2020
@input:		Database connection,Table, Column, Col-Value
@outout:	Total no. of record(s) found in a table
*/

function GetIfSessionStarted($conn, $SESSION)
{
	if(empty($_SESSION['user_name'])){ $msg = "<div class='alert alert-danger strong'>Please Sign In.</div>"; }
	echo $msg;
}