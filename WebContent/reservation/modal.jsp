<!DOCTYPE html>
<html>
<head>
	<title>modal test</title>
</head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
        // Select all tabs
		$('.nav-tabs a').click(function(){
    		$(this).tab('show');
		})
</script>
<style type="text/css">
	#small { 
		width: 60px;
		height: 40px;
		
		background-color: #F7BE81;
		text-align: center;
	}
</style>


<body>

<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#regionCategory">Open Region</button>

<!-- modal -->

<div id="regionCategory" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <nav class="navbar navbar-default navbar-fixed-top">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
			  <li role="presentation" class="active"><a data-target="#region1" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="false">서울</a></li>
			  <li role="presentation" class=""><a data-target="#region2" role="tab" id="region2-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">북부</a></li>
			  <li role="presentation" class=""><a data-target="#region3" role="tab" id="region3-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">중부</a></li>
			  <li role="presentation" class=""><a data-target="#region4" role="tab" id="region4-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">남부</a></li>
			</ul>
		</nav>
		<div class="tab-content" style="margin-top: 50px;">
			<div role="region1" class="tab-pane fade active in" id="region1" aria-labelledby="reegion1-tab">
				<div id="small">서울</div>
			</div>
			<div role="region2" class="tab-pane fade" id="region2" aria-labelledby="region2-tab">
				<div id="small">강원</div>
			</div>
			<div role="region3" class="tab-pane fade" id="region3" aria-labelledby="region3-tab">
				<div id="small">인천</div>
				<div id="small">경기</div>
				<div id="small">충북</div>
			</div>
			<div role="region4" class="tab-pane fade" id="region4" aria-labelledby="region4-tab">
				<div id="small">제주</div>
				<div id="small">경북</div>
				<div id="small">경남</div>
				<div id="small">충남</div>
				<div id="small">전남</div>
				<div id="small">전북</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>