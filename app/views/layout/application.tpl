<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title></title>
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="stylesheet" href="{$root}/assets/css/bootstrap.min.css">
</head>

<body>

  <div class="container">
    <header>
    <h2>Relative path: {$relative_path}</h2>
    </header>
    <div id="main" role="main">
      {$yield}
    </div>
  </div> <!--! end of .container -->



  <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.6.2.min.js"><\/script>')</script>


</body>
</html>