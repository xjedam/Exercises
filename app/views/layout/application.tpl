<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title></title>
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="stylesheet" href="{$root}/assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="{$root}/assets/css/style.css">
</head>

<body>
    <div class="topbar">
      <div class="topbar-inner masthead">
        <div class="container-fluid">
          <a class="brand" href="{$root}">Zadania</a>
          <ul class="nav">
            <li>{link_to n="Zadania" l="/zadania" nav=1}</li>
          </ul>
        </div>
      </div>
    </div>
  <div class="container-fluid">
      <div class="sidebar">
        <div class="well">
          <h5>Ostatnie zadania</h5>
          <ul>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
          </ul>
        </div>
      </div>
    <div class="content">
      {$yield}
    </div>
  </div> <!--! end of .container -->



  <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.6.2.min.js"><\/script>')</script>


</body>
</html>