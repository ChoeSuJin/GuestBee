<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
        $(document).ready(function() {
            $('a[data-toggle="tab"]').on('hidden.bs.tab', function(e){
                alert("이벤트 실행됨");
            });
        });
        // Select all tabs
		$('.nav-tabs a').click(function(){
    		$(this).tab('show');
		})
</script>
<style type="text/css">
	#small { 
		width: 70px;
		height: 40px;
		background-color: #F7BE81;
		text-align: center;
	}
</style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
	<ul id="myTab" class="nav nav-tabs" role="tablist">
	  <li role="presentation" class="active"><a data-target="#region1" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">region1</a></li>
	  <li role="presentation" class=""><a data-target="#region2" role="tab" id="region2-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">region2</a></li>
	  <li role="presentation" class=""><a data-target="#region3" role="tab" id="region3-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">region3</a></li>
	  <li role="presentation" class=""><a data-target="#region4" role="tab" id="region4-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">region4</a></li>
	</ul>
</nav>
	<div class="tab-content" style="margin-top: 60px;">
		<div role="region1" class="tab-pane fade active in" id="region1" aria-labelledby="reegion1-tab">
			<div id="small">region1</div>
			<div id="small">region2</div>
			<div id="small">region3</div>
			<div id="small">region4</div>
		</div>
		<div role="region2" class="tab-pane fade" id="region2" aria-labelledby="region2-tab">
			<div id="small">region1</div>
			<div id="small">region2</div>
			<div id="small">region3</div>
			<div id="small">region4</div>
		</div>
		<div role="region3" class="tab-pane fade" id="region3" aria-labelledby="region3-tab">
			<div id="small">region1</div>
			<div id="small">region2</div>
			<div id="small">region3</div>
			<div id="small">region4</div>
		</div>
		<div role="region4" class="tab-pane fade" id="region4" aria-labelledby="region4-tab">
			<div id="small">region1</div>
			<div id="small">region2</div>
			<div id="small">region3</div>
			<div id="small">region4</div>
		</div>
	</div>

</body>
</html>

